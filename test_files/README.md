### Bare-metal C Program

You need to make an ELF file without headers, which starts at the address `0x8000_0000` by the following instructions:

```
// Make an assembly file from a C file.
$ riscv64-unknown-elf-gcc -S -nostdlib foo.c

// Make a binary file from an assembly file with start position 0x8000_0000.
$ riscv64-unknown-elf-gcc -Wl,-Ttext=0x80000000 -nostdlib -o foo foo.s

// Remove headers from a binary file.
$ riscv64-unknown-elf-objcopy -O binary foo foo.text
```

### our version
```
riscv32-unknown-linux-gnu-gcc  -march=rv32im -nostdlib -Wl,-N,-Ttext=0x80000000 -o dummy dummy.c
riscv32-unknown-linux-gnu-objcopy -O binary dummy dummy.bin
riscv32-unknown-linux-gnu-objdump -d -M no-aliases dummy > dummy.asm
```