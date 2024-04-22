use super::{
    compute,
    decode::{table_main, ExecID, InstrType},
    reg::{Regs, REGISTERS_COUNT},
};
use crate::{
    config::{BYTE, HALFWORD, WORD},
    exception::{get_nemu_trap_cause, Exception, ExecutionException, NemuTrapCause},
    memory::dram::Dram,
};
use std::collections::BTreeMap;
use colored::*;

macro_rules! instr_count {
    ($cpu: ident, $instr_name: ident) => {
        if $cpu.is_count {
            *$cpu.instr_counter.entry(ExecID::$instr_name).or_insert(0) += 1;
        }
    };
}

pub enum AccessType {
    Instr,
    Load,
    Store,
}

pub struct Cpu {
    /// general(integer) registers
    pub xregs: Regs,
    /// program counter
    pub pc: u32,
    /// memory, but actually it should be the system bus, but others are yet to implement
    pub mem: Dram,
    // instruction counter for debug
    pub instr_counter: BTreeMap<ExecID, u32>,
    /// whether to use instruction counter
    pub is_count: bool,
    /// the previous instruction, for debug
    pub pre_instr: u32,
}

impl Cpu {
    pub fn new() -> Self {
        Cpu {
            xregs: Regs::new(),
            pc: 0,
            mem: Dram::new(),
            instr_counter: BTreeMap::new(),
            is_count: false,
            pre_instr: 0,
        }
    }

    /// reset cpu
    pub fn reset(&mut self) {
        self.pc = 0;
        for i in 0..REGISTERS_COUNT {
            self.xregs.write(i as u32, 0);
        }
    }

    /// implement for debug and trace
    fn trace(&self, instr: u32, instr_type: &str) {
        log::trace!(
            "{}:{}: pc: 0x{:08x}, instr: 0x{:08x}, instr_type: {}",
            file!(), line!(),
            self.pc,
            instr,
            instr_type.green()
        );
    }

    /// translate a virtual address to a physical address
    /// but temporarily directly return because we do not imply virt addr
    fn translate(&mut self, addr: u32, _access_type: AccessType) -> Result<u32, Exception> {
        Ok(addr)
    }

    /// read `size`-bit data from the system with translation
    /// so we should pass in a virt addr
    fn read(&mut self, vaddr: u32, size: u8) -> Result<u32, Exception> {
        let paddr = self.translate(vaddr, AccessType::Load)?;
        let result = self.mem.read(paddr, size);

        result
    }

    /// write `size`-bit data to the system with translation
    fn write(&mut self, vaddr: u32, value: u32, size: u8) -> Result<(), Exception> {
        let paddr = self.translate(vaddr, AccessType::Store)?;
        let result = self.mem.write(paddr, value, size);

        result
    }

    /// fetch an instruction from the memory at the `pc`
    pub fn fetch(&mut self, size: u8) -> Result<u32, Exception> {
        if size != HALFWORD && size != WORD {
            return Err(Exception::InstructionAccessFault);
        }

        let pc_addr = self.translate(self.pc, AccessType::Instr)?;

        // though the possible err in `read` is LoadAccessFault, but in here we should return InstrAccessFault
        match self.mem.read(pc_addr, size) {
            Ok(value) => Ok(value),
            Err(_) => Err(Exception::InstructionAccessFault),
        }
    }

    /// execute an instr. Raise exception if sth wrong happens. else return the instr executed
    pub fn execute(&mut self) -> Result<ExecutionException, Exception> {
        //compressed instructions are not taken into account for now
        let instr = self.fetch(WORD)?;
        let exe_result = self.execute_general(instr)?;
        log::debug!("{}:{}: the current pc is 0x{:08x}",file!(), line!(), self.pc);
        match exe_result {
            ExecutionException::Executing => {}
            _ => {
                return Ok(exe_result);
            }
        }

        self.pc += 4;
        self.pre_instr = instr;

        Ok(ExecutionException::Executing)
    }

    pub fn execute_general(&mut self, instr: u32) -> Result<ExecutionException, Exception> {
        // let opcode: u32 = instr & 0x0000007f;
        let rd = (instr & 0x00000f80) >> 7;
        let rs1 = (instr & 0x000f8000) >> 15;
        let rs2 = (instr & 0x01f00000) >> 20;
        // let funct3 = (instr & 0x00007000) >> 12;
        // let funct7 = (instr & 0xfe000000) >> 25;

        let exec_id = table_main(&instr);
        // TODO 这个match可以用宏定义大幅度简化代码本身

        let instr_type = exec_id.get_type();
        match instr_type {
            InstrType::R => {
                match exec_id {
                    ExecID::add => {
                        // add x[rs2] to x[rs1], write to x[rd]
                        instr_count!(self, add);
                        self.trace(instr, "add");

                        self.xregs
                            .write(rd, compute::add(self.xregs.read(rs1), self.xregs.read(rs2)));
                    }
                    ExecID::and => {
                        instr_count!(self, and);
                        self.trace(instr, "and");

                        self.xregs
                            .write(rd, compute::and(self.xregs.read(rs1), self.xregs.read(rs2)));
                    }
                    ExecID::div => {
                        instr_count!(self, div);
                        self.trace(instr, "div");

                        let dividend = self.xregs.read(rs1);
                        let divisor = self.xregs.read(rs2);
                        if divisor == 0 {
                            self.xregs.write(rd, u32::MAX);
                            log::warn!("Division by zero!");
                        } else if (dividend as i32) == i32::min_value() && (divisor as i32) == -1 {
                            self.xregs.write(rd, dividend as u32);
                            log::warn!("Division overflow!");
                        } else {
                            self.xregs.write(rd, compute::div(dividend, divisor));
                        }
                    }
                    ExecID::mul => {
                        instr_count!(self, mul);
                        self.trace(instr, "mul");

                        self.xregs
                            .write(rd, compute::mul(self.xregs.read(rs1), self.xregs.read(rs2)));
                    }
                    ExecID::mulh => {
                        instr_count!(self, mulh);
                        self.trace(instr, "mulh");

                        self.xregs.write(
                            rd,
                            compute::mulh(self.xregs.read(rs1), self.xregs.read(rs2)),
                        );
                    }
                    ExecID::mulhu => {
                        instr_count!(self, mulhu);
                        self.trace(instr, "mulhu");

                        self.xregs.write(
                            rd,
                            compute::mulhu(self.xregs.read(rs1), self.xregs.read(rs2)),
                        );
                    }
                    ExecID::or => {
                        instr_count!(self, or);
                        self.trace(instr, "or");

                        self.xregs
                            .write(rd, compute::or(self.xregs.read(rs1), self.xregs.read(rs2)));
                    }
                    ExecID::rem => {
                        instr_count!(self, rem);
                        self.trace(instr, "rem");

                        let dividend = self.xregs.read(rs1);
                        let divisor = self.xregs.read(rs2);
                        if divisor == 0 {
                            self.xregs.write(rd, dividend as u32);
                            log::warn!("Division by zero!");
                        } else if (dividend as i32) == i32::min_value() && (divisor as i32) == -1 {
                            self.xregs.write(rd, 0);
                            log::warn!("Division overflow!");
                        } else {
                            self.xregs.write(rd, compute::rem(dividend, divisor));
                        }
                    }
                    ExecID::remu => {
                        instr_count!(self, remu);
                        self.trace(instr, "remu");

                        let dividend = self.xregs.read(rs1);
                        let divisor = self.xregs.read(rs2);
                        if divisor == 0 {
                            self.xregs.write(rd, dividend as u32);
                            log::warn!("Division by zero!");
                        } else {
                            self.xregs.write(rd, compute::remu(dividend, divisor));
                        }
                    }
                    ExecID::sll => {
                        instr_count!(self, sll);
                        self.trace(instr, "sll");

                        self.xregs
                            .write(rd, compute::sll(self.xregs.read(rs1), self.xregs.read(rs2)));
                    }
                    ExecID::slt => {
                        instr_count!(self, slt);
                        self.trace(instr, "slt");

                        self.xregs
                            .write(rd, compute::slt(self.xregs.read(rs1), self.xregs.read(rs2)));
                    }
                    ExecID::sltu => {
                        instr_count!(self, sltu);
                        self.trace(instr, "sltu");

                        self.xregs.write(
                            rd,
                            compute::sltu(self.xregs.read(rs1), self.xregs.read(rs2)),
                        );
                    }
                    ExecID::sra => {
                        instr_count!(self, sra);
                        self.trace(instr, "sra");

                        self.xregs
                            .write(rd, compute::sra(self.xregs.read(rs1), self.xregs.read(rs2)));
                    }
                    ExecID::srl => {
                        instr_count!(self, srl);
                        self.trace(instr, "srl");

                        self.xregs
                            .write(rd, compute::srl(self.xregs.read(rs1), self.xregs.read(rs2)));
                    }
                    ExecID::sub => {
                        instr_count!(self, sub);
                        self.trace(instr, "sub");

                        self.xregs
                            .write(rd, compute::sub(self.xregs.read(rs1), self.xregs.read(rs2)));
                    }
                    ExecID::xor => {
                        instr_count!(self, xor);
                        self.trace(instr, "xor");

                        self.xregs
                            .write(rd, compute::xor(self.xregs.read(rs1), self.xregs.read(rs2)));
                    }
                    _ => panic!("Incorrect Classification for Instructions!"),
                }
            }
            InstrType::I => {
                let imm = ((instr as i32) >> 20) as u32;
                let addr = self.xregs.read(rs1).wrapping_add(imm);

                log::trace!("the I-Type imm is 0x{:08x}", imm);

                match exec_id {
                    ExecID::addi => {
                        instr_count!(self, addi);
                        self.trace(instr, "addi");

                        self.xregs
                            .write(rd, compute::addi(self.xregs.read(rs1), imm));
                    }
                    ExecID::andi => {
                        instr_count!(self, andi);
                        self.trace(instr, "andi");

                        self.xregs
                            .write(rd, compute::andi(self.xregs.read(rs1), imm));
                    }
                    ExecID::jalr => {
                        instr_count!(self, jalr);
                        self.trace(instr, "jalr");

                        let offset = imm as i32;
                        let temp = self.pc.wrapping_add(4);
                        let target = ((self.xregs.read(rs1) as i32).wrapping_add(offset)) & !1;

                        // FIXME 目前无法正确处理函数的返回部分的问题！
                        log::warn!("the target pc is 0x{:08x}, the read value of ra is {}", target, self.xregs.read(rs1) as i32);

                        self.pc = (target as u32).wrapping_sub(4);
                        self.xregs.write(rd, temp);
                    }
                    ExecID::lb => {
                        instr_count!(self, lb);
                        self.trace(instr, "lb");

                        let val = self.read(addr, BYTE)?;
                        self.xregs.write(rd, val as i8 as i32 as u32);
                    }
                    ExecID::lbu => {
                        instr_count!(self, lbu);
                        self.trace(instr, "lbu");

                        let val = self.read(addr, BYTE)?;
                        self.xregs.write(rd, val);
                    }
                    ExecID::lh => {
                        instr_count!(self, lh);
                        self.trace(instr, "lh");

                        let val = self.read(addr, HALFWORD)?;
                        self.xregs.write(rd, val as i16 as i32 as u32);
                    }
                    ExecID::lhu => {
                        instr_count!(self, lhu);
                        self.trace(instr, "lhu");

                        let val = self.read(addr, HALFWORD)?;
                        self.xregs.write(rd, val);
                    }
                    ExecID::lw => {
                        instr_count!(self, lw);
                        self.trace(instr, "lw");

                        let val = self.read(addr, WORD)?;
                        self.xregs.write(rd, val);
                    }
                    ExecID::ori => {
                        instr_count!(self, ori);
                        self.trace(instr, "ori");

                        self.xregs
                            .write(rd, compute::ori(self.xregs.read(rs1), imm));
                    }
                    ExecID::slli => {
                        instr_count!(self, slli);
                        self.trace(instr, "slli");

                        self.xregs
                            .write(rd, compute::slli(self.xregs.read(rs1), imm));
                    }
                    ExecID::slti => {
                        instr_count!(self, slti);
                        self.trace(instr, "slti");

                        self.xregs
                            .write(rd, compute::slti(self.xregs.read(rs1), imm));
                    }
                    ExecID::sltiu => {
                        instr_count!(self, sltiu);
                        self.trace(instr, "sltiu");

                        self.xregs
                            .write(rd, compute::sltiu(self.xregs.read(rs1), imm));
                    }
                    ExecID::srai => {
                        instr_count!(self, srai);
                        self.trace(instr, "srai");

                        self.xregs
                            .write(rd, compute::srai(self.xregs.read(rs1), imm));
                    }
                    ExecID::srli => {
                        instr_count!(self, srli);
                        self.trace(instr, "srli");

                        self.xregs
                            .write(rd, compute::srli(self.xregs.read(rs1), imm));
                    }
                    ExecID::xori => {
                        instr_count!(self, xori);
                        self.trace(instr, "xori");

                        self.xregs
                            .write(rd, compute::xori(self.xregs.read(rs1), imm));
                    }
                    _ => panic!("Incorrect Classification for Instructions!"),
                }
            }
            InstrType::U => {
                let imm = (instr & 0xfffff000) as i32 as u32;
                match exec_id {
                    ExecID::auipc => {
                        instr_count!(self, auipc);
                        self.trace(instr, "auipc");

                        self.xregs.write(rd, self.pc.wrapping_add(imm));
                        // self.xregs.write(rd, compute::addi(self.xregs.read(0), imm));  // it is more elegant to use this expression, but would lower the performance
                    }
                    ExecID::lui => {
                        instr_count!(self, lui);
                        self.trace(instr, "lui");

                        self.xregs.write(rd, imm);
                    }
                    _ => panic!("Incorrect Classification for Instructions!"),
                }
            }
            InstrType::B => {
                // imm[12|10:5|4:1|11] = inst[31|30:25|11:8|7]
                let imm = ((((instr & 0x80000000) as i32) >> 19) as u32)
                    | ((instr & 0x00000080) << 4)
                    | ((instr & 0x7e000000) >> 20)
                    | ((instr & 0x00000f00) >> 7);

                match exec_id {
                    ExecID::beq => {
                        instr_count!(self, beq);
                        self.trace(instr, "beq");

                        if self.xregs.read(rs1) == self.xregs.read(rs2) {
                            self.pc = self.pc.wrapping_add(imm).wrapping_sub(4);
                            // 虽然根据手册这里只是pc+imm，但是实际上pc是在fetch阶段+4的，所以这里要减4
                        }
                    }
                    ExecID::bge => {
                        instr_count!(self, bge);
                        self.trace(instr, "bge");

                        if (self.xregs.read(rs1) as i32) >= (self.xregs.read(rs2) as i32) {
                            self.pc = self.pc.wrapping_add(imm).wrapping_sub(4);
                        }
                    }
                    ExecID::bgeu => {
                        instr_count!(self, bgeu);
                        self.trace(instr, "bgeu");

                        if self.xregs.read(rs1) >= self.xregs.read(rs2) {
                            self.pc = self.pc.wrapping_add(imm).wrapping_sub(4);
                        }
                    }
                    ExecID::blt => {
                        instr_count!(self, blt);
                        self.trace(instr, "blt");

                        if (self.xregs.read(rs1) as i32) < (self.xregs.read(rs2) as i32) {
                            self.pc = self.pc.wrapping_add(imm).wrapping_sub(4);
                        }
                    }
                    ExecID::bltu => {
                        instr_count!(self, bltu);
                        self.trace(instr, "bltu");

                        if self.xregs.read(rs1) < self.xregs.read(rs2) {
                            self.pc = self.pc.wrapping_add(imm).wrapping_sub(4);
                        }
                    }
                    ExecID::bne => {
                        instr_count!(self, bne);
                        self.trace(instr, "bne");

                        if self.xregs.read(rs1) != self.xregs.read(rs2) {
                            self.pc = self.pc.wrapping_add(imm).wrapping_sub(4);
                        }
                    }
                    _ => panic!("Incorrect Classification for Instructions!"),
                }
            }
            InstrType::J => {
                let offset = (((instr & 0x80000000) as i32 >> 11) as u32) // imm[20]
                    | (instr & 0xff000) // imm[19:12]
                    | ((instr >> 9) & 0x800) // imm[11]
                    | ((instr >> 20) & 0x7fe); // imm[10:1]
                log::trace!("the J-Type offset is 0x{:08x}", offset);
                match exec_id {
                    ExecID::jal => {
                        instr_count!(self, jal);
                        self.trace(instr, "jal");

                        self.xregs.write(rd, self.pc.wrapping_add(4));
                        self.pc = self.pc.wrapping_add(offset).wrapping_sub(4);
                    }
                    _ => panic!("Incorrect Classification for Instructions!"),
                }
            }
            InstrType::S => {
                let offset =
                    (((instr & 0xfe000000) as i32 >> 20) as u32) | ((instr >> 7) & 0x1f);
                let addr = self.xregs.read(rs1).wrapping_add(offset);
                match exec_id {
                    ExecID::sb => {
                        instr_count!(self, sb);
                        self.trace(instr, "sb");

                        self.write(addr, self.xregs.read(rs2), BYTE)?;
                    }
                    ExecID::sh => {
                        instr_count!(self, sh);
                        self.trace(instr, "sh");

                        self.write(addr, self.xregs.read(rs2), HALFWORD)?;
                    }
                    ExecID::sw => {
                        instr_count!(self, sw);
                        self.trace(instr, "sw");

                        self.write(addr, self.xregs.read(rs2), WORD)?;
                    }
                    _ => panic!("Incorrect Classification for Instructions!"),
                }
            }
            InstrType::Special => match exec_id {
                ExecID::NemuTrap => {
                    let result = get_nemu_trap_cause(instr);
                    match result {
                        NemuTrapCause::Success => {
                            log::info!("exit normally!");
                            return Ok(ExecutionException::Success);
                    }
                        NemuTrapCause::Failed => {
                            log::error!("exit abnormally!");
                            return Ok(ExecutionException::Failed);
                        }
                    }
                }
                ExecID::Invalid => {
                    log::warn!("Invalid Instruction: 0x{:x}", instr);
                }
                _ => panic!("Incorrect Classification for Instructions!"),
            },
        }

        Ok(ExecutionException::Executing)
    }
}
