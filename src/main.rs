use std::{fs::{self, File}, io::Read};
use rust_nemu::{config::DRAM_BASE, emulator::Emulator};

fn main() {
    std::env::set_var("RUST_LOG", "info");
    env_logger::init();
    let paths = fs::read_dir("test_files/build/").unwrap();

    for path in paths {
        let path = path.unwrap().path();
        if path.extension()== Some(std::ffi::OsStr::new("bin")) {
            println!("Running test: {:?}", path);
            let mut exec_path = path.clone();
            exec_path.set_extension("");
            let mut emu = Emulator::new(Some(&exec_path));
            let mut fd = File::open(path).unwrap();
            let mut buffer = Vec::new();
            fd.read_to_end(&mut buffer).unwrap();
            emu.initialize_dram(buffer);
            emu.initialize_pc(DRAM_BASE);
            emu.run();
        }
    }
}

// fn main() {
//     std::env::set_var("RUST_LOG", "trace");
//     env_logger::init();
//     let data_path = "test_files/build/goldbatch.bin";
//     let mut emu = Emulator::new(data_path.split('.').next());
//     let buffer = fs::read(data_path).unwrap();
//     log::info!("data name: {}", data_path);
//     emu.initialize_dram(buffer);
//     emu.initialize_pc(DRAM_BASE);
//     emu.run();
// }

// FIXME crc32 内存访问越界