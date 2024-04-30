# Define the target directory for build files
BUILD_DIR := build

# Define the cross-compiler toolchain
CC := riscv32-unknown-linux-gnu-gcc
OBJCOPY := riscv32-unknown-linux-gnu-objcopy
OBJDUMP := riscv32-unknown-linux-gnu-objdump

# Define default flags for compilation
CFLAGS := -fno-pic -march=rv32im -mabi=ilp32 -nostdlib -Ibasic/ -Wl,-N,-Tbasic/linker.ld -O1 -fno-asynchronous-unwind-tables -fno-builtin -fno-stack-protector -Wall -Werror -std=gnu11

# Define default assembly flags for objcopy
OBJCOPYFLAGS := -O binary

# Define default disassembly flags for objdump
OBJDUMPFLAGS := -d -M no-aliases

$(shell if [ ! -e $(BUILD_DIR) ];then mkdir -p $(BUILD_DIR); fi)

SOURCES := $(wildcard src/*.c)

# Define the targets for .bin and .asm files
BINARIES := $(addprefix $(BUILD_DIR)/, $(notdir $(SOURCES:%.c=%.bin)))
ASSEMBLIES := $(addprefix $(BUILD_DIR)/, $(notdir $(SOURCES:%.c=%.asm)))

# The main target
all: $(BINARIES) $(ASSEMBLIES)

# Rule to build .bin and .asm files from .c files
$(BUILD_DIR)/%.bin $(BUILD_DIR)/%.asm: src/%.c
	$(CC) $(CFLAGS) -c -o $(BUILD_DIR)/start.o basic/start.c
	$(CC) $(CFLAGS) -c -o $(BUILD_DIR)/$*.o $<
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/$* $(BUILD_DIR)/start.o $(BUILD_DIR)/$*.o
	$(OBJDUMP) $(OBJDUMPFLAGS) $(BUILD_DIR)/$* > $(BUILD_DIR)/$*.asm
	$(OBJCOPY) $(OBJCOPYFLAGS) $(BUILD_DIR)/$* $(BUILD_DIR)/$*.bin

# Phony target to build a specific .bin and .asm file
.PHONY: build
build:
	$(MAKE) $(BUILD_DIR)/$(TARGET).bin $(BUILD_DIR)/$(TARGET).asm

# Define a rule to clean the build directory
clean:
	@echo "Cleaning build directory: $(BUILD_DIR)"
	@rm -rf $(BUILD_DIR)
