module instruction_memory(
    input [7:0] pc,
    output reg [15:0] instruction
);
reg [15:0] instruction_set [0:255];
initial begin
    instruction_set[0]=16'hC005;  //LOAD R1,5
    instruction_set[1]=16'hC107;  //LOAD R2,7
    instruction_set[2]=16'h0010 ;  //AND R1,R2 (r1=5)
    instruction_set[3]=16'h600F; //xor r1, 15; (r1=A);
    instruction_set[4]=16'h3100;// not r2(r2=F8)
    //instruction_set[5]=16'h8020; //JMP 2 (AND r1 ,r2) it works
    instruction_set[5]=16'h4000;  //AND R1,0 now zero_flag=1
    instruction_set[6]=16'h9030; // JZ 3;
    

end
always @(*) begin
    instruction=instruction_set[pc];
    
end

endmodule