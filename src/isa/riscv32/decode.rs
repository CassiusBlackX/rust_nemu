/// the implemented instrs are as follows
#[derive(PartialEq, Eq, PartialOrd, Ord, Debug)]
#[allow(non_camel_case_types)]
pub enum ExecID {
    add,
    addi,
    and,
    andi,
    auipc,
    beq,
    bge,
    bgeu,
    blt,
    bltu,
    bne,
    div,
    divu,
    Invalid, // invalid !
    jal,
    jalr,
    lb,
    lbu,
    lh,
    lhu,
    lui,
    lw,
    mul,
    mulh,
    mulhu,
    NemuTrap,
    or,
    ori,
    rem,
    remu,
    sb,
    sh,
    sll,
    slli,
    slt,
    slti,
    sltiu,
    sltu,
    sra,
    srai,
    srl,
    srli,
    sub,
    sw,
    xor,
    xori,
}

pub enum InstrType {
    R,
    I,
    S,
    B,
    U,
    J,
    Special,
}

impl ExecID {
    pub fn get_type(&self) -> InstrType {
        match self {
            ExecID::add
            | ExecID::and
            | ExecID::div
            | ExecID::divu
            | ExecID::mul
            | ExecID::mulh
            | ExecID::mulhu
            | ExecID::or
            | ExecID::rem
            | ExecID::remu
            | ExecID::sll
            | ExecID::slt
            | ExecID::sltu
            | ExecID::sra
            | ExecID::srl
            | ExecID::sub
            | ExecID::xor => InstrType::R,
            ExecID::addi
            | ExecID::andi
            | ExecID::jalr
            | ExecID::lb
            | ExecID::lbu
            | ExecID::lh
            | ExecID::lhu
            | ExecID::lw
            | ExecID::ori
            | ExecID::slli
            | ExecID::slti
            | ExecID::sltiu
            | ExecID::srai
            | ExecID::srli
            | ExecID::xori => InstrType::I,
            ExecID::auipc | ExecID::lui => InstrType::U,
            ExecID::beq | ExecID::bge | ExecID::bgeu | ExecID::blt | ExecID::bltu | ExecID::bne => {
                InstrType::B
            }
            ExecID::jal => InstrType::J,
            ExecID::sb | ExecID::sh | ExecID::sw => InstrType::S,
            ExecID::NemuTrap | ExecID::Invalid => InstrType::Special,
        }
    }
}

impl std::fmt::Display for ExecID {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let instr_name = match *self {
            ExecID::add => "add",
            ExecID::addi => "addi",
            ExecID::and => "and",
            ExecID::andi => "andi",
            ExecID::auipc => "auipc",
            ExecID::beq => "beq",
            ExecID::bge => "bge",
            ExecID::bgeu => "bgeu",
            ExecID::blt => "blt",
            ExecID::bltu => "bltu",
            ExecID::bne => "bne",
            ExecID::div => "div",
            ExecID::divu => "divu",
            ExecID::Invalid => "Invalid",
            ExecID::jal => "jal",
            ExecID::jalr => "jalr",
            ExecID::lb => "lb",
            ExecID::lbu => "lbu",
            ExecID::lh => "lh",
            ExecID::lhu => "lhu",
            ExecID::lui => "lui",
            ExecID::lw => "lw",
            ExecID::mul => "mul",
            ExecID::mulh => "mulh",
            ExecID::mulhu => "mulhu",
            ExecID::NemuTrap => "NemuTrap",
            ExecID::or => "or",
            ExecID::ori => "ori",
            ExecID::rem => "rem",
            ExecID::remu => "remu",
            ExecID::sb => "sb",
            ExecID::sh => "sh",
            ExecID::sll => "sll",
            ExecID::slli => "slli",
            ExecID::slt => "slt",
            ExecID::slti => "slti",
            ExecID::sltiu => "sltiu",
            ExecID::sltu => "sltu",
            ExecID::sra => "sra",
            ExecID::srai => "srai",
            ExecID::srl => "srl",
            ExecID::srli => "srli",
            ExecID::sub => "sub",
            ExecID::sw => "sw",
            ExecID::xor => "xor",
            ExecID::xori => "xori",
        };
        write!(f, "{}", instr_name)
    }
}
// fn pattern_decode(pattern: &str, key: &mut u32, mask: &mut u32, shift: &mut u32) {
//     let mut key_val: u32 = 0;
//     let mut mask_val: u32 = 0;
//     let mut shift_val: u32 = 0;

//     for c in pattern.chars() {
//         if c != ' ' {
//             assert!(
//                 c == '0' || c == '1' || c == '?',
//                 "invalid character '{}' in pattern string",
//                 c
//             );
//             key_val = (key_val << 1) | if c == '1' { 1 } else { 0 };
//             mask_val = (mask_val << 1) | if c == '?' { 1 } else { 0 };
//             shift_val = if c == '?' { shift_val + 1 } else { 0 };
//         }
//     }

//     *key = key_val >> shift_val;
//     *mask = mask_val >> shift_val;
//     *shift = shift_val;
// }
fn pattern_decode(str: &str, key: &mut u32, mask: &mut u32, shift: &mut u32) {
    let mut __key: u32 = 0;
    let mut __mask: u32 = 0;
    let mut __shift: u32 = 0;
    let mut flag1 = false;
    let mut flag2 = false;
    let len = str.chars().filter(|&c| c != ' ').count();
    for (i, c) in str.chars().filter(|&c| c != ' ').enumerate() {
        match c {
            '0' | '1' => {
                __key = (__key << 1) | (c as u32 - '0' as u32);
                __mask = (__mask << 1) | 1;
                flag1 = true;
            }
            '?' => {
                if flag1 && !flag2 {
                    __shift = (len - i) as u32;
                    flag2 = true;
                }
            }
            ' ' => continue,
            _ => panic!("Invalid character in pattern"),
        }
    }

    *key = __key;
    *mask = __mask;
    *shift = if __shift != 0 { __shift } else { 0 }; // 因为i是索引，所以最后返回值是+1,虽然没有正确处理只有最后一个字符为?的情况，但是因为不会出现，所以也不影响
}

fn table_load(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;

    pattern_decode(
        "??????? ????? ????? 010 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::lw;
    }

    pattern_decode(
        "??????? ????? ????? 100 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::lbu;
    }

    pattern_decode(
        "??????? ????? ????? 001 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::lh;
    }

    pattern_decode(
        "??????? ????? ????? 101 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::lhu;
    }

    pattern_decode(
        "??????? ????? ????? 000 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::lb;
    }
    ExecID::Invalid
}

fn table_store(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;
    pattern_decode(
        "??????? ????? ????? 010 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );

    if (instr >> shift) & mask == key {
        return ExecID::sw;
    }
    pattern_decode(
        "??????? ????? ????? 000 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );

    if (instr >> shift) & mask == key {
        return ExecID::sb;
    }
    pattern_decode(
        "??????? ????? ????? 001 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );

    if (instr >> shift) & mask == key {
        return ExecID::sh;
    }
    ExecID::Invalid
}

fn table_add_sub_mul(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;
    pattern_decode(
        "0000000 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );

    if (instr >> shift) & mask == key {
        return ExecID::add;
    }
    pattern_decode(
        "0100000 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );

    if (instr >> shift) & mask == key {
        return ExecID::sub;
    }
    pattern_decode(
        "0000001 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );

    if (instr >> shift) & mask == key {
        return ExecID::mul;
    }
    ExecID::Invalid
}

fn table_sltu_mulhu(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;
    pattern_decode(
        "0000000 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );

    if (instr >> shift) & mask == key {
        return ExecID::sltu;
    }
    pattern_decode(
        "0000001 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );

    if (instr >> shift) & mask == key {
        return ExecID::mulhu;
    }
    ExecID::Invalid
}

fn table_xor_div(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;
    pattern_decode(
        "0000000 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );

    if (instr >> shift) & mask == key {
        return ExecID::xor;
    }
    pattern_decode(
        "0000001 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::div;
    }
    ExecID::Invalid
}

fn table_or_rem(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;
    pattern_decode(
        "0000000 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::or;
    }
    pattern_decode(
        "0000001 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::rem;
    }
    ExecID::Invalid
}

fn table_and_remu(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;
    pattern_decode(
        "0000000 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::and;
    }
    pattern_decode(
        "0000001 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::remu;
    }
    ExecID::Invalid
}

fn table_srl_sra_divu(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;
    pattern_decode(
        "0100000 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::sra;
    }
    pattern_decode(
        "0000000 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::srl;
    }
    pattern_decode(
        "0000001 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::divu;
    }
    ExecID::Invalid
}

fn table_sll_mulh(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;
    pattern_decode(
        "0000000 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::sll;
    }
    pattern_decode(
        "0000001 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::mulh;
    }
    ExecID::Invalid
}

fn table_slt(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;
    pattern_decode(
        "0000000 ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::slt;
    }
    ExecID::Invalid
}

fn table_srli_srai(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;
    pattern_decode(
        "010000? ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::srai;
    }
    pattern_decode(
        "000000? ????? ????? ??? ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::srli;
    }
    ExecID::Invalid
}

fn table_cal(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;
    pattern_decode(
        "??????? ????? ????? 000 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return table_add_sub_mul(instr);
    }
    pattern_decode(
        "??????? ????? ????? 001 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return table_sll_mulh(instr);
    }
    pattern_decode(
        "??????? ????? ????? 011 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return table_sltu_mulhu(instr);
    }
    pattern_decode(
        "??????? ????? ????? 100 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return table_xor_div(instr);
    }
    pattern_decode(
        "??????? ????? ????? 010 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return table_slt(instr);
    }
    pattern_decode(
        "??????? ????? ????? 110 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return table_or_rem(instr);
    }
    pattern_decode(
        "??????? ????? ????? 111 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return table_and_remu(instr);
    }
    pattern_decode(
        "??????? ????? ????? 101 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return table_srl_sra_divu(instr);
    }
    ExecID::Invalid
}

fn table_cal_imm(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;
    pattern_decode(
        "??????? ????? ????? 000 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );

    if (instr >> shift) & mask == key {
        return ExecID::addi;
    }
    pattern_decode(
        "??????? ????? ????? 111 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::andi;
    }
    pattern_decode(
        "??????? ????? ????? 011 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::sltiu;
    }
    pattern_decode(
        "??????? ????? ????? 100 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::xori;
    }
    pattern_decode(
        "??????? ????? ????? 101 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return table_srli_srai(instr);
    }
    pattern_decode(
        "??????? ????? ????? 001 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::slli;
    }
    pattern_decode(
        "??????? ????? ????? 110 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::ori;
    }
    pattern_decode(
        "??????? ????? ????? 010 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::slti;
    }
    ExecID::Invalid
}

fn table_branch(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;
    pattern_decode(
        "??????? ????? ????? 000 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::beq;
    }
    pattern_decode(
        "??????? ????? ????? 001 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::bne;
    }
    pattern_decode(
        "??????? ????? ????? 101 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::bge;
    }
    pattern_decode(
        "??????? ????? ????? 111 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::bgeu;
    }
    pattern_decode(
        "??????? ????? ????? 100 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::blt;
    }
    pattern_decode(
        "??????? ????? ????? 110 ????? ????? ??",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::bltu;
    }
    ExecID::Invalid
}

pub fn table_main(instr: &u32) -> ExecID {
    let mut key: u32 = 0;
    let mut mask: u32 = 0;
    let mut shift: u32 = 0;

    pattern_decode(
        "??????? ????? ????? ??? ????? 00000 11",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        // unsafe {self.decode_I(0) };
        return table_load(instr);
    }
    pattern_decode(
        "??????? ????? ????? ??? ????? 01000 11",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        // unsafe { self.decode_S(0) };
        return table_store(instr);
    }
    pattern_decode(
        "??????? ????? ????? ??? ????? 01101 11",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        // unsafe { self.decode_U(0) };
        return ExecID::lui;
    }
    pattern_decode(
        "??????? ????? ????? ??? ????? 00100 11",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        // unsafe { self.decode_I(0) };
        return table_cal_imm(instr);
    }
    pattern_decode(
        "??????? ????? ????? ??? ????? 00101 11",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        // unsafe { self.decode_U(0) };
        return ExecID::auipc;
    }
    pattern_decode(
        "??????? ????? ????? ??? ????? 11011 11",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        // unsafe { self.decode_J(0) };
        return ExecID::jal;
    }
    pattern_decode(
        "??????? ????? ????? ??? ????? 11001 11",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        // unsafe { self.decode_I(0) };
        return ExecID::jalr;
    }
    pattern_decode(
        "??????? ????? ????? ??? ????? 01100 11",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        // unsafe { self.decode_R(0) };
        return table_cal(instr);
    }
    pattern_decode(
        "??????? ????? ????? ??? ????? 11000 11",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        // unsafe { self.decode_B(0) };
        return table_branch(instr);
    }
    pattern_decode(
        "??????? ????? ????? ??? ????? 11010 11",
        &mut key,
        &mut mask,
        &mut shift,
    );
    if (instr >> shift) & mask == key {
        return ExecID::NemuTrap;
    }
    ExecID::Invalid
}

mod test {
    #[allow(unused_imports)] // for test]
    use super::{pattern_decode, table_main, ExecID};
    #[test]
    fn test_pattern_decode() {
        let mut key: u32 = 0;
        let mut mask: u32 = 0;
        let mut shift: u32 = 0;
        pattern_decode(
            "0000001 ????? ????? ??? ????? ????? ??",
            &mut key,
            &mut mask,
            &mut shift,
        );
        assert_eq!(key, 0b1);
        assert_eq!(mask, 0b1111111);
        assert_eq!(shift, 25);
    }

    #[test]
    fn test_table() {
        let instr = 0xff010113;
        assert_eq!(table_main(&instr), ExecID::addi);
    }
}
