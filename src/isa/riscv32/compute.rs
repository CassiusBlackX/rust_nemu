
// basic arithmetic
pub fn add(src1: u32, src2: u32) -> u32 {
    src1.wrapping_add(src2)
}

pub fn addi(src1: u32, imm: u32) -> u32 {
    src1.wrapping_add(imm)
}

pub fn sub(src1: u32, src2: u32) -> u32 {
    src1.wrapping_sub(src2)
}

pub fn subi(src1: u32, imm: u32) -> u32 {
    src1.wrapping_sub(imm)
}

pub fn and(src1: u32, src2: u32) -> u32 {
    src1 & src2
}

pub fn andi(src1: u32, imm: u32) -> u32 {
    src1 & imm
}

pub fn or(src1: u32, src2: u32) -> u32 {
    src1 | src2
}

pub fn ori(src1: u32, imm: u32) -> u32 {
    src1 | imm
}

pub fn xor(src1: u32, src2: u32) -> u32 {
    src1 ^ src2
}

pub fn xori(src1: u32, imm: u32) -> u32 {
    src1 ^ imm
}

/// in rv32, only the low 5 bits of the shift amount are used
/// in rv64, only the low 6 bits of the shift amount are used
pub fn sll(src1: u32, src2: u32) -> u32 {
    src1 << (src2 & 0x1f)
}

/// in rv32, only the low 5 bits of the shift amount are used
/// in rv64, only the low 6 bits of the shift amount are used
pub fn slli(src1: u32, imm: u32) -> u32 {
    src1 << (imm & 0x1f)
}

/// in rv32, only the low 5 bits of the shift amount are used
/// in rv64, only the low 6 bits of the shift amount are used
pub fn srl(src1: u32, src2: u32) -> u32 {
    src1 >> (src2 & 0x1f)
}

/// in rv32, only the low 5 bits of the shift amount are used
/// in rv64, only the low 6 bits of the shift amount are used
pub fn srli(src1: u32, imm: u32) -> u32 {
    src1 >> (imm & 0x1f)
}

/// in rv32, only the low 5 bits of the shift amount are used
/// in rv64, only the low 6 bits of the shift amount are used
pub fn sra(src1: u32, src2: u32) -> u32 {
    (src1 as i32 >> (src2 & 0x1f)) as u32
}

/// in rv32, only the low 5 bits of the shift amount are used
/// in rv64, only the low 6 bits of the shift amount are used
pub fn srai(src1: u32, imm: u32) -> u32 {
    (src1 as i32 >> (imm & 0x1f)) as u32
}

pub fn mul(src1: u32, src2: u32) -> u32 {
    let src1 = src1 as i32;
    let src2 = src2 as i32;
    src1.wrapping_mul(src2) as u32
}

pub fn mulh(src1: u32, src2: u32) -> u32 {
    let src1 = src1 as i32 as i64;
    let src2 = src2 as i32 as i64;
    #[cfg(feature = "riscv32")]
    return (src1.wrapping_mul(src2) >> 32) as u32;
    #[cfg(feature = "riscv64")]
    return (src1.wrapping_mul(src2) >> 64) as u32;
}

pub fn mulhu(src1: u32, src2: u32) -> u32 {
    let src1 = src1 as u64;
    let src2 = src2 as u64;
    #[cfg(feature = "riscv32")]
    return (src1.wrapping_mul(src2) >> 32) as u32;
    #[cfg(feature = "riscv64")]
    return (src1.wrapping_mul(src2) >> 64) as u32;
}

/// the `div` here is very fragile, it may cause a panic
pub fn div(src1: u32, src2: u32) -> u32 {
    let src1 = src1 as i32;
    let src2 = src2 as i32;
    src1.wrapping_div(src2) as u32
}

/// the `divu` here is very fragile, it may cause a panic
pub fn divu(src1: u32, src2: u32) -> u32 {
    let src1 = src1 as i32 as i64;
    let src2 = src2 as i32 as i64;
    #[cfg(feature = "riscv32")]
    return (src1.wrapping_div(src2) >> 32) as u32;
    #[cfg(feature = "riscv64")]
    return (src1.wrapping_div(src2) >> 64) as u32;
}

pub fn rem(src1: u32, src2: u32) -> u32 {
    let src1 = src1 as i32;
    let src2 = src2 as i32;
    src1.wrapping_rem(src2) as u32
}

pub fn remu(src1: u32, src2: u32) -> u32 {
    let src1 = src1 as i32 as i64;
    let src2 = src2 as i32 as i64;
    #[cfg(feature = "riscv32")]
    return (src1.wrapping_rem(src2) >> 32) as u32;
    #[cfg(feature = "riscv64")]
    return (src1.wrapping_rem(src2) >> 64) as u32;
}


// TODO 是否考虑一下把比较操作也放到这里来实现
pub fn slt(src1: u32, src2: u32) -> u32 {
    ((src1 as i32) < (src2 as i32)) as u32
}

pub fn sltu(src1: u32, src2: u32) -> u32 {
    (src1 < src2) as u32
}

pub fn slti(src1: u32, imm: u32) -> u32 {
    ((src1 as i32) < (imm as i32)) as u32
}

pub fn sltiu(src1: u32, imm: u32) -> u32 {
    (src1 < imm) as u32
}