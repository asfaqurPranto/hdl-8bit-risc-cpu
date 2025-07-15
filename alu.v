module alu(

    input wire [7:0] operand1,operand2,
    input wire [1:0] alu_op,

    output reg [7:0] result,
    output zero_flag

);

always @(*) begin
    case (alu_op)
        2'b00: result=operand1&operand2;
        2'b01: result=operand1|operand2;
        2'b10: result=operand1^operand2;
        2'b11: result=~operand1;

    endcase
    
end
assign zero_flag= (result==8'b00000000)? 1'b1:1'b0; 
endmodule