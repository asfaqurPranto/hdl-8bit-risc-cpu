# 🧠 8-bit RISC CPU in Verilog

This project is a simple 8-bit **RISC (Reduced Instruction Set Computer)** CPU designed using Verilog HDL. It supports basic arithmetic and logical operations, branching, and memory instruction. 

---

## 🚀 Features

- **Instruction Modes:**
  - **Register Mode** – Operands are CPU registers
  - **Immediate Mode** – One operand is an immediate value

- **ALU Operations:**
  - `AND`
  - `OR`
  - `XOR`
  - `NOT`

- **Branching Instructions:**
  - `JMP` – Unconditional jump
  - `JZ` – Jump if zero (branch if result is 0)

- **Memory Access:**
  - `LOAD` – Load data from memory into a register
  - `STORE` – Store result from register to memory

- **Data Width:**
  - 8-bit data bus
  - 16-bit instruction word

---

## 🧰 Components

- `alu.v` – Arithmetic and Logic Unit  
- `register_file.v` – General-purpose registers (16 total: R1–R16)  
- `control_unit.v` – Instruction decoder and FSM controller  
- `data_memory.v` – Simple 256X8 RAM for data
- `instruction_memory.v`- Holds the instruction to be executed
- `immediate_mode.v`- if the instruction is immediate mode then instead of loading the second operand from memory it directly assigns the value
- `program_counter.v`- checks if jmp or jz condition true, if true then jump to corresponding instruction and if false increase prog_counter by one
- `top.v` – Top-level integration of datapath and controller  
- `tb.v` – Testbench for simulation

---

## 📐 Instruction Format

**Instruction Width:** 16 bits  
All instructions follow a 4-bit opcode followed by register or immediate fields. The unused bits are marked as `xxxx` (don’t care or reserved).

### 1. Register Mode

| Operation | Format                        | Binary Example         |
|----------|--------------------------------|------------------------|
| `AND R1, R2` | `0000 0000 0001 xxxx`        | `AND R1, R2` → `0000 0000 0001 xxxx` |
| `XOR R2, R3` | `0010 0001 0010 xxxx`        | `XOR R2, R3` → `0010 0001 0010 xxxx` |
| `NOT R1`     | `0011 0000 xxxx xxxx`        | `NOT R1` → `0011 0000 xxxx xxxx`     |

### 2. Immediate Mode

| Operation     | Format                          | Binary Example                     |
|---------------|----------------------------------|------------------------------------|
| `AND R1, 5`   | `0100 0000 0000 0101`            | `AND R1, 5` → `0100 0000 0000 0101` |
| `XOR R2, 15`  | `0110 0001 0000 1111`            | `XOR R2, 15` → `0110 0001 0000 1111` |

### 3. Branching

| Operation | Format                          | Binary Example                |
|-----------|----------------------------------|-------------------------------|
| `JMP 5`   | `1000 0000 0101 xxxx`            | `JMP 5` → `1000 0000 0101 xxxx` |
| `JZ 5`    | `1001 0000 0101 xxxx`            | `JZ 5` → `1001 0000 0101 xxxx`  |

### 4. Memory Operations

| Operation     | Format                          | Binary Example                     |
|---------------|----------------------------------|------------------------------------|
| `LOAD R1, 5`  | `1100 0000 0000 0101`            | `LOAD R1, 5` → `1100 0000 0000 0101` |
| `STORE 10`    | `1101 0000 1010 xxxx`            | `STORE 10` → `1101 0000 1010 xxxx`   |

---

**Instructions are written inside instruction_memory.v and simulation is shown in waveform.vcd**

