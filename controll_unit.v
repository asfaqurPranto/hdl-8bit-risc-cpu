module controll_unit(
    input wire [3:0] opcode,
    output reg reg_write,mem_read,mem_write,jump,jump_zero,
    output reg imm_mode,
    output reg [1:0] alu_op
);

always @(*) begin

    reg_write = 1'b0;
    mem_read = 1'b0;
    mem_write = 1'b0;
    jump = 1'b0;
    jump_zero = 1'b0;
    alu_op = 1'b0;
    imm_mode=1'b0;
    
    case (opcode[3:2])
        4'b00:// Register Mode
        begin
          reg_write=1'b1;
          
          alu_op=opcode[1:0];
        end 
        4'b01: // Immediate Mode
        begin
            //mem_read=1'b1;
            reg_write=1'b1;
            alu_op=opcode[1:0];
            imm_mode=1'b1;
        end
        4'b10://Branching
        begin
            if(opcode[1:0]==2'b00) //JMP
            begin
            jump=1'b1;
            end
            
            else //JZ jump zero
            begin
              jump_zero=1'b1;
            end
        end
        4'b11: //memory instruction (LOAD-STORE)
        begin
          if(opcode[1:0]==2'b00) //Load
          begin
            
            reg_write=1'b1;
          end
          else // 01 store
          begin
            mem_write=1'b1;
          end
        end

    endcase

    
end

endmodule