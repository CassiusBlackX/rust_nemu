use std::fs;
use r_emu::{config::DRAM_BASE, emulator::Emulator};

fn main() {
    env_logger::init();
    let paths = fs::read_dir("tests/build").unwrap();

    for path in paths {
        let path = path.unwrap().path();
        if path.extension().unwrap() == "bin" {
            println!("Running test: {:?}", path);
            let mut emu = Emulator::new();
            let buffer = fs::read(path).unwrap();
            emu.initialize_dram(buffer);
            emu.initialize_pc(DRAM_BASE);
            emu.run();
        }
    }
}