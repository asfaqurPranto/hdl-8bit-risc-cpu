module immediate_mode(
    input wire [15:0] instruction,
    input wire imm_mode,
    input wire [7:0] read_data2,
    output reg[7:0] operand2
);

always @(*) begin
    if(imm_mode) // Immediate mode is enabled then 
    begin
      operand2=instruction[7:0];
    end
    else
    begin
        operand2=read_data2;
    end
end

endmodule