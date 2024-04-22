use std::fmt;
use crate::config::{DRAM_BASE, DRAM_SIZE, POINTER_TO_DTB};

pub const REGISTERS_COUNT: usize = 32;
#[derive(Debug)]
pub struct Regs {
    xregs: [u32; REGISTERS_COUNT],
}

/// Only implemented general registers for riscv32
/// can consider to implement float registers in the future
impl fmt::Display for Regs {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> fmt::Result {
        let abi = [
            "$0", "ra", "sp", "gp", "tp", "t0", "t1", "t2",
            "s0", "s1", "a0", "a1", "a2", "a3","a4", "a5", 
            "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7", 
            "s8", "s9", "s10", "s11","t3", "t4", "t5", "t6",
        ];
        let mut output = String::from("");
        for i in (0..REGISTERS_COUNT).step_by(4) {
            output = format!(
                "{}\n{}",
                output,
                format!(
                    "x{:02}({})={:>#18x} x{:02}({})={:>#18x} x{:02}({})={:>#18x} x{:02}({})={:>#18x}",
                    i,
                    abi[i],
                    self.read(i as u32),
                    i + 1,
                    abi[i + 1],
                    self.read(i as u32 + 1),
                    i + 2,
                    abi[i + 2],
                    self.read(i as u32 + 2),
                    i + 3,
                    abi[i + 3],
                    self.read(i as u32 + 3),
                )
            );
        }
        write!(f, "{}", output)
    }
}

impl Regs {
    pub fn new() -> Self {
        let mut regs = [0; REGISTERS_COUNT];
        // the stack pointer is set in the default maximum memory size + the start address of dram
        regs[2] = DRAM_BASE + DRAM_SIZE;
        // according to riscv book, `a0` and `a1` should be saved from previous boot loader stage
        regs[10] = 0;
        regs[11] = POINTER_TO_DTB;
        Self { xregs: regs }
    }

    /// read the value of the register in the given index
    pub fn read(&self, index: u32) -> u32 {
        self.xregs[index as usize]
    }

    /// write the value to the register in the given index
    pub fn write(&mut self, index: u32, value: u32) {
        // $0 is hardwired to 0
        if index != 0 {
            self.xregs[index as usize] = value;
        }
    }

}
