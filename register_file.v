module register_set(
    input clk,
    input reg_write,
    input [3:0] read_reg_addr1,read_reg_addr2,write_reg_addr,
    input [7:0] write_data,

    output reg [7:0] read_data1,read_data2

);

reg [7:0] reg_set [0:15];

always @(posedge clk) begin
    if(reg_write)
    begin
      reg_set[write_reg_addr]<=write_data;
    end
    
end

always @(*) begin
    read_data1=reg_set[read_reg_addr1];
    read_data2=reg_set[read_reg_addr2];
end


endmodule