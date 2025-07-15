`include "alu.v"
`include "controll_unit.v"
`include "data_memory.v"
`include "instruction_memory.v"
`include "program_counter.v"
`include "register_file.v"
`include "immediate_mode.v"

module top(
    input wire clk,
    input wire reset,
    output wire [15:0] instruction,
    output wire [7:0] current_pc,alu_result

);

wire [7:0]  next_pc, jump_addr, read_data1, read_data2;
wire [7:0]  mem_data, write_data, operand2;

wire reg_write, mem_read, mem_write, zero_flag, jump, jump_zero, imm_mode;
wire [1:0] alu_op;

pc uut1(
    .clk(clk),
    .jump(jump),
    .reset(reset),
    .jump_zero(jump_zero),
    .zero_flag(zero_flag),
    .jump_addr(instruction[11:4]),
    .current_pc(current_pc)
);

instruction_memory uut2(
    .pc(current_pc),
    .instruction(instruction)
);

controll_unit uut3(
    .opcode(instruction[15:12]),
    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .jump(jump),
    .jump_zero(jump_zero),
    .alu_op(alu_op),
    .imm_mode(imm_mode)
);

register_set uut4(
    .clk(clk),
    .reg_write(reg_write),
    .read_reg_addr1(instruction[11:8]),
    .read_reg_addr2(instruction[7:4]),
    .write_reg_addr(instruction[11:8]),
    .write_data(write_data),
    //outputs
    .read_data1(read_data1),
    .read_data2(read_data2)
);

immediate_mode uut5(
    .imm_mode(imm_mode),
    .instruction(instruction),
    .read_data2(read_data2),
    .operand2(operand2)
);

alu uut6 (
    .operand1(read_data1),
    .operand2(operand2),
    .alu_op(alu_op),
    .result(alu_result),
    .zero_flag(zero_flag)
);

data_memory uut7 (
    .clk(clk),
    .address(instruction[11:4]),  
    .write_data(alu_result),  
    .mem_read(mem_read),
    .mem_write(mem_write),
    .read_data(mem_data)
);

assign write_data = (instruction[15:12] == 4'b1100) ? instruction[7:0] :         
    alu_result;                                           

endmodule