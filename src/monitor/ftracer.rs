use crate::{config::WordT, exception::Exception};
use core::fmt;
use goblin::elf::Elf;
use std::{fs::File, io::Read, path::PathBuf};

#[derive(PartialEq, Clone, Copy, Debug)]
pub enum FuncState {
    Call,
    Ret,
    Initial,
}

impl fmt::Display for FuncState {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            FuncState::Call => write!(f, "Call"),
            FuncState::Ret => write!(f, "Ret"),
            FuncState::Initial => write!(f, "Initial"),
        }
    }
}

#[derive(Clone)]
struct FuncInfo {
    name: String,
    start_addr: WordT,
    size: WordT,
    call_count: usize,
    ret_count: usize,
    state: FuncState,
}

impl FuncInfo {
    pub fn new(func_name: &str, start_addr: WordT, size: WordT) -> Self {
        Self {
            name: func_name.to_string(),
            start_addr,
            size,
            call_count: 0,
            ret_count: 0,
            state: FuncState::Initial,
        }
    }

    fn update(&mut self, state: FuncState) {
        match state {
            FuncState::Call => self.call_count += 1,
            FuncState::Ret => self.ret_count += 1,
            _ => {}
        }
        self.state = state;
    }
}

/// ElfParser is a struct that parses an ELF file and extracts function information.
struct ElfParser {
    funcs: Vec<FuncInfo>,
}

impl ElfParser {
    pub fn new(file_name: &PathBuf) -> Self {
        let mut fd = File::open(file_name).unwrap();
        let mut buffer = Vec::new();
        fd.read_to_end(&mut buffer).unwrap();
        let elf = Elf::parse(&buffer).unwrap();

        let mut funcs = Vec::new();
        let strtab = &elf.strtab;
        for sym in &elf.syms {
            if sym.st_type() == goblin::elf::sym::STT_FUNC {
                if let Some(name) = strtab.get_at(sym.st_name) {
                    funcs.push(FuncInfo::new(
                        name,
                        sym.st_value as WordT,
                        sym.st_size as WordT,
                    ));
                }
            }
        }

        // HACK add the special address for the _end function
        funcs.push(FuncInfo::new("_end", 0x83ffffec, 0x23));
        // FIXME no idea the _end function should be regarded as size of 8 or 4~~
        Self { funcs }
    }

    fn get_mut(&mut self, addr: &WordT) -> Option<&mut FuncInfo> {
        for func in self.funcs.iter_mut() {
            if addr >= &func.start_addr && addr < &(func.start_addr + func.size) {
                return Some(func);
            }
        }
        None
    }
}

impl fmt::Display for ElfParser {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let mut output = String::new();
        for func in self.funcs.iter() {
            output.push_str(&format!(
                "{}: 0x{:x} ~ 0x{:x}, call_count:{}, ret_count:{}, state:{}\n",
                func.name,
                func.start_addr,
                func.start_addr + func.size,
                func.call_count,
                func.ret_count,
                func.state
            ));
        }
        write!(f, "{}", output)
    }
}

pub struct FTracer {
    elf_parser: ElfParser,
    call_stack: Vec<FuncInfo>,
}

impl FTracer {
    pub fn new(file_name: &PathBuf) -> Self {
        Self {
            elf_parser: ElfParser::new(file_name),
            call_stack: Vec::new(),
        }
    }

    pub fn update(&mut self, addr: WordT, state: FuncState) -> Result<(), Exception> {
        match self.elf_parser.get_mut(&addr) {
            Some(func_info) => {
                func_info.update(state);
                self.call_stack.push(func_info.clone());
                Ok(())
            }
            None => {
                log::warn!("Function not found at address: 0x{:08x}", addr);
                Err(Exception::FTracerFailed)
            }
        }
    }
}

impl fmt::Display for FTracer {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let mut output = String::new();
        let mut indent = 0;
        let mut prev_state = FuncState::Initial;
        for func in self.call_stack.iter() {
            match func.state {
                FuncState::Call | FuncState::Initial => {
                    if prev_state == FuncState::Call || prev_state == FuncState::Initial {
                        indent += 2;
                    }
                    output.push_str(&format!(
                        "{:indent$}call {}\n",
                        "",
                        func.name,
                        indent = indent
                    ));
                }
                FuncState::Ret => {
                    if prev_state == FuncState::Ret {
                        indent -= 2;
                    }
                    output.push_str(&format!(
                        "{:indent$}ret {}\n",
                        "",
                        func.name,
                        indent = indent
                    ));
                }
            }
            prev_state = func.state.clone();
        }
        write!(f, "{}", output)
    }
}

mod test {
    #[allow(unused_imports)]
    use super::*;

    #[test]
    fn test_elf_parser_exec() {
        let elf_parser = ElfParser::new(&PathBuf::from("test_files/build/goldbatch"));
        println!("{}", elf_parser); // to check if the fmt is working correctly, use `cargo test -- --nocapture`
        assert_eq!(elf_parser.funcs.len(), 6); // `_start`, `check`, `main`, `is_prime`, `goldbatch`, `_end`(this func do not really exist)
    }

    #[test]
    fn test_elf_parser_o() {
        let elf_parser = ElfParser::new(&PathBuf::from("test_files/build/dummy.o"));
        println!("{}", elf_parser);
        assert_eq!(elf_parser.funcs.len(), 2); // `main`, `_end`
    }

    #[test]
    #[allow(unused_must_use)]
    fn test_ftracer() {
        let mut ftracer = FTracer::new(&PathBuf::from("test_files/build/goldbatch"));
        ftracer.update(0x80000000, FuncState::Call); // _start
        ftracer.update(0x8000012c, FuncState::Call); // main
        ftracer.update(0x800000c0, FuncState::Call); // goldbatch
        ftracer.update(0x80000078, FuncState::Call); // is_prime
        ftracer.update(0x800000b4, FuncState::Ret); // ret is_prime
        ftracer.update(0x80000078, FuncState::Call); // is_prime
        ftracer.update(0x800000b4, FuncState::Ret); // ret is_prime
        ftracer.update(0x80000120, FuncState::Ret); // ret goldbatch
        ftracer.update(0x80000064, FuncState::Call); // check
        ftracer.update(0x80000074, FuncState::Ret); // ret check
        ftracer.update(0x80000174, FuncState::Ret); // ret main
        ftracer.update(0x80000054, FuncState::Ret); // ret _start
        println!("{}", ftracer);
        assert_eq!(ftracer.call_stack.len(), 12);
        assert_eq!(ftracer.call_stack[0].name, "_start");
        assert_eq!(ftracer.call_stack[4].state, FuncState::Ret);
        assert_eq!(ftracer.call_stack[4].call_count, 1);
        assert_eq!(ftracer.call_stack[6].call_count, 2);
    }
}
