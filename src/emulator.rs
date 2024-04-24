use crate::{exception::ExecutionException, isa::riscv32::cpu::Cpu};


pub struct  Emulator {
    pub cpu: Cpu,
    pub is_debug: bool,
}

impl Emulator {
    pub fn new() -> Emulator {
        Emulator {
            cpu: Cpu::new(),
            is_debug: false,
        }
    }

    /// reset the cpu state
    pub fn reset(&mut self) {
        self.cpu.reset();
    }

    /// set the binary data to the begining of the DRAM from the emulator console
    pub fn initialize_dram(&mut self, data: Vec<u8>) {
        self.cpu.mem.initialize(data);
    }

    /// set pc to the cpu field
    pub fn initialize_pc(&mut self, pc: u32) {
        self.cpu.pc = pc;
    }

    /// run the emulator
    pub fn run(&mut self) {
        for _ in 0..u32::MAX {
            match self.cpu.execute() {
                Ok(ExecutionException::Success) => {
                    log::info!("{}:{}  emulator exited successfully", file!(), line!());
                    return;
                }
                Ok(ExecutionException::Failed) => {
                    panic!("{}:{}  Error in executing the instruction!, emulator exited with failure", file!(), line!());
                }
                Ok(ExecutionException::Executing) => {}
                Err(_) => {
                    panic!("{}:{}  Error in executing the instruction!", file!(), line!());
                }
            }
        }
    }
}