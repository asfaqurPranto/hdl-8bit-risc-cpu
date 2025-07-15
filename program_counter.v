module pc(
    input clk,
    input jump,reset,jump_zero,
    input zero_flag,
    input [7:0] jump_addr,
    output reg [7:0] current_pc

);

always @(posedge clk or posedge reset) begin
    if(reset)
    begin
      current_pc<=8'b00000000;
    end
    else if(jump)
    begin
      current_pc<=jump_addr;
    end
    else if(jump_zero&&zero_flag)
    begin
        current_pc<=jump_addr;
    end
    else
    begin
      current_pc<=current_pc+1;
    end
    
end

endmodule