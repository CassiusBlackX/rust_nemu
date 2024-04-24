use std::fs;
use rust_nemu::{config::DRAM_BASE, emulator::Emulator};

// fn main() {
//     env_logger::init();
//     let paths = fs::read_dir("tests/build/").unwrap();

//     for path in paths {
//         let path = path.unwrap().path();
//         if path.extension().and_then(|s| s.to_str()) == Some("bin") {
//             println!("Running test: {:?}", path);
//             let mut emu = Emulator::new();
//             let buffer = fs::read(path).unwrap();
//             emu.initialize_dram(buffer);
//             emu.initialize_pc(DRAM_BASE);
//             emu.run();
//         }
//     }
// }

fn main() {
    std::env::set_var("RUST_LOG", "trace");
    env_logger::init();
    let mut emu = Emulator::new();
    let data_path = "tests/build/crc32.bin";
    let buffer = fs::read(data_path).unwrap();
    log::info!("data name: {}", data_path);
    emu.initialize_dram(buffer);
    emu.initialize_pc(DRAM_BASE);
    emu.run();
}

// FIXME crc32 load-store quick-sort to-lower-case