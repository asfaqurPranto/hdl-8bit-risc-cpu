`include "top.v"

`timescale 1ns / 1ps

module testbench;
    reg clk;
    reg reset;
    wire [7:0] current_pc;
    wire [7:0] alu_result;
    wire [15:0] instruction;

    
    top dut (
        .clk(clk),
        .reset(reset),
        .current_pc(current_pc),
        .alu_result(alu_result),
        .instruction(instruction)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    
    initial begin
        reset = 1;
        #15 reset = 0;
        #150 $finish;
    end

    
    initial begin
        $dumpfile("waveform.vcd");     
        $dumpvars(0, testbench);       
    end



endmodule
