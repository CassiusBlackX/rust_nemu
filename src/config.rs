pub const DRAM_BASE: u32 = 0x80000000;
pub const DRAM_SIZE: u32 = 0x4000000;
pub const POINTER_TO_DTB: u32 = 0x1020;

#[cfg(feature = "riscv32")]
pub type WordT = u32;
#[cfg(feature = "riscv32")]
pub type SWordT = i32;
#[cfg(feature = "riscv32")]
pub type DoubleWordT = u64;
#[cfg(feature = "riscv32")]
pub type SDoubleWordT = i64;
#[cfg(feature = "riscv64")]
pub type WordT = u64;
#[cfg(feature = "riscv64")]
pub type SWordT = i64;
#[cfg(feature = "riscv64")]
pub type DoubleWordT = u128;
#[cfg(feature = "riscv64")]
pub type SDoubleWordT = i128;

pub const BYTE: u8 = 8;
pub const HALFWORD: u8 = 16;
pub const WORD: u8 = 32;
pub const DOUBLEWORD: u8 = 64;

