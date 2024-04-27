use crate::{config::{WordT, BYTE, DRAM_BASE, DRAM_SIZE, HALFWORD, WORD}, exception::Exception};
#[cfg(feature = "riscv64")]
use crate::config::DOUBLEWORD;

/// use a vector to simu mem
/// for precise manipulation, we use `Vec<u8>`
#[derive(Debug)]
pub struct Dram {
    pub dram: Vec<u8>,
    code_size: WordT,
}

impl Dram {
    /// create a new mem obj with default mem size
    pub fn new() -> Self {
        Self {
            dram: vec![0; DRAM_SIZE as usize],
            code_size: 0,
        }
    }

    /// set the binary in the memory
    pub fn initialize(&mut self, binary: Vec<u8>){
        self.code_size = binary.len() as WordT;
        self.dram.splice(..binary.len(), binary.iter().cloned());
        // FIXME it seems unnacessary to use `.cloned()`
        // 使用splice方法的话能够灵活的更改self.dram的大小，节省或者动态增加空间。
    }

    /// load `size`-bit data from the memory
    pub fn read(&self, addr: WordT, size: u8) -> Result<WordT, Exception> {
        match size {
            BYTE => Ok(self.read8(addr)),
            HALFWORD => Ok(self.read16(addr)),
            WORD => Ok(self.read32(addr)),
            #[cfg(feature = "riscv64")]
            DOUBLEWORD => Ok(self.read64(addr)),
            _ => Err(Exception::LoadAccessFault),
        }
    }

    /// store `size`-bit data to the memory
    pub fn write(&mut self, addr: WordT, value: WordT, size: u8) -> Result<(), Exception> {
        match size {
            BYTE => self.write8(addr, value),
            HALFWORD => self.write16(addr, value),
            WORD => self.write32(addr, value),
            #[cfg(feature = "riscv64")]
            DOUBLEWORD => self.write64(addr, value),
            _ => return Err(Exception::StoreAMOAccessFault),
        }
        Ok(())
    }

    /// wirte a byte to the mem
    /// user must be sure that val is in the range of `u8`
    fn write8(&mut self, addr: WordT, val: WordT) {
        let index = (addr - DRAM_BASE) as usize;
        self.dram[index] = val as u8;
    }

    /// wirte 2 bytes to the mem
    fn write16(&mut self, addr: WordT, val: WordT) {
        let index = (addr - DRAM_BASE) as usize;
        self.dram[index] = (val & 0xff) as u8;
        self.dram[index+1] = ((val>>8) & 0xff) as u8;
    }

    /// write 4 bytes to the mem
    fn write32(&mut self, addr: WordT, val: WordT) {
        let index = (addr - DRAM_BASE) as usize;
        self.dram[index] = (val & 0xff) as u8;
        self.dram[index+1] = ((val>>8) & 0xff) as u8;
        self.dram[index+2] = ((val>>16) & 0xff) as u8;
        self.dram[index+3] = ((val>>24) & 0xff) as u8;
    }

    #[cfg(feature = "riscv64")]
    /// write 8 bytes to the mem
    fn write64(&mut self, addr: WordT, val: WordT) {
        let index = (addr - DRAM_BASE) as usize;
        self.dram[index] = (val & 0xff) as u8;
        self.dram[index+1] = ((val>>8) & 0xff) as u8;
        self.dram[index+2] = ((val>>16) & 0xff) as u8;
        self.dram[index+3] = ((val>>24) & 0xff) as u8;
        self.dram[index+4] = ((val>>32) & 0xff) as u8;
        self.dram[index+5] = ((val>>40) & 0xff) as u8;
        self.dram[index+6] = ((val>>48) & 0xff) as u8;
        self.dram[index+7] = ((val>>56) & 0xff) as u8;
    }

    /// read a byte from the mem
    fn read8(&self, addr: WordT) -> WordT {
        let index = (addr - DRAM_BASE) as usize;
        self.dram[index] as WordT
    }
    
    /// read 2 bytes from the mem with **little endian**!!
    fn read16(&self, addr: WordT) -> WordT {
        let index = (addr - DRAM_BASE) as usize;
        (self.dram[index] as WordT) | ((self.dram[index+1] as WordT) << 8)
    }

    /// read 4 bytes from the mem with **little endian** 
    fn read32(&self, addr: WordT) -> WordT {
        let index = (addr - DRAM_BASE) as usize;
        (self.dram[index] as WordT) | ((self.dram[index+1] as WordT) << 8) | ((self.dram[index+2] as WordT) << 16) | ((self.dram[index+3] as WordT) << 24)
    }

    #[cfg(feature = "riscv64")]
    /// read 8 bytes from the mem with **little endian**
    fn read64(&self, addr: WordT) -> WordT {
        let index = (addr - DRAM_BASE) as usize;
        (self.dram[index] as WordT) | ((self.dram[index+1] as WordT) << 8) | ((self.dram[index+2] as WordT) << 16) | ((self.dram[index+3] as WordT) << 24) | ((self.dram[index+4] as WordT) << 32) | ((self.dram[index+5] as WordT) << 40) | ((self.dram[index+6] as WordT) << 48) | ((self.dram[index+7] as WordT) << 56)
    }
}

mod test {
    #[allow(unused_imports)]
    use super::*;
    #[test]
    fn test_read_lhu() {
        let mut dram = Dram::new();
        let data = vec![0x00, 0x00, 0x58, 0x02, 0xbc, 0x4a, 0xff, 0x7f, 0x00, 0x80, 0x00, 0x81, 0xcd, 0xab, 0xff, 0xff];
        dram.initialize(data);
        assert_eq!(dram.read(DRAM_BASE, HALFWORD).unwrap(), 0x00000000u32);
        assert_eq!(dram.read(DRAM_BASE+2, HALFWORD).unwrap(), 0x00000258u32);
        assert_eq!(dram.read(DRAM_BASE+4, HALFWORD).unwrap(), 0x00004abcu32);
        assert_eq!(dram.read(DRAM_BASE+6, HALFWORD).unwrap(), 0x00007fffu32);
        assert_eq!(dram.read(DRAM_BASE+8, HALFWORD).unwrap(), 0x00008000u32);
        assert_eq!(dram.read(DRAM_BASE+10, HALFWORD).unwrap(), 0x00008100u32);
        assert_eq!(dram.read(DRAM_BASE+12, HALFWORD).unwrap(), 0x0000abcdu32);
        assert_eq!(dram.read(DRAM_BASE+14, HALFWORD).unwrap(), 0x0000ffffu32);
    }

    #[test]
    fn test_read_lh() {
        let mut dram = Dram::new();
        let data = vec![0x00, 0x00, 0x58, 0x02, 0xbc, 0x4a, 0xff, 0x7f, 0x00, 0x80, 0x00, 0x81, 0xcd, 0xab, 0xff, 0xff];
        dram.initialize(data);
        assert_eq!(dram.read(DRAM_BASE, HALFWORD).unwrap() as i16 as i32 as u32, 0x00000000u32);
        assert_eq!(dram.read(DRAM_BASE+2, HALFWORD).unwrap() as i16 as i32 as u32, 0x00000258u32);
        assert_eq!(dram.read(DRAM_BASE+4, HALFWORD).unwrap() as i16 as i32 as u32, 0x00004abcu32);
        assert_eq!(dram.read(DRAM_BASE+6, HALFWORD).unwrap() as i16 as i32 as u32, 0x00007fffu32);
        assert_eq!(dram.read(DRAM_BASE+8, HALFWORD).unwrap() as i16 as i32 as u32, 0xffff8000u32);
        assert_eq!(dram.read(DRAM_BASE+10, HALFWORD).unwrap() as i16 as i32 as u32, 0xffff8100u32);
        assert_eq!(dram.read(DRAM_BASE+12, HALFWORD).unwrap() as i16 as i32 as u32, 0xffffabcdu32);
        assert_eq!(dram.read(DRAM_BASE+14, HALFWORD).unwrap() as i16 as i32 as u32, 0xffffffffu32);
    }
}