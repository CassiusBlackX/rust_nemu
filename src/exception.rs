#[derive(Debug, PartialEq)]
pub enum Exception {
    /// With the addition of the C extension, no instructions can raise
    /// instruction-address-misaligned exceptions.
    InstructionAddressMisaligned,
    InstructionAccessFault,
    IllegalInstruction(u64),
    Breakpoint,
    LoadAddressMisaligned,
    LoadAccessFault,
    StoreAMOAddressMisaligned,
    StoreAMOAccessFault,
    EnvironmentCallFromUMode,
    EnvironmentCallFromSMode,
    EnvironmentCallFromMMode,
    // Stores a trap value (the faulting address) for page fault exceptions.
    InstructionPageFault(u64),
    LoadPageFault(u64),
    StoreAMOPageFault(u64),
}

pub enum ExecutionException {
    Success,
    Failed,
    Executing,
}

pub enum NemuTrapCause {
    Success,
    Failed,
}

pub fn get_nemu_trap_cause(instr: u32) -> NemuTrapCause {
    match instr {
        0x6b => NemuTrapCause::Success,
        0xeb => NemuTrapCause::Failed,
        _ => NemuTrapCause::Failed,
    }
}