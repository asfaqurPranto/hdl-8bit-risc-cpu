module data_memory(

    input clk,
    input [7:0] address,
    input [7:0] write_data,
    input mem_read,mem_write,
    output reg [7:0] read_data

);

reg [7:0] mem [0:255];

always @(posedge clk ) begin
    if(mem_write)
    begin
      mem[address]<=write_data;
    end

end
always @(posedge clk) begin
    if(mem_read)
    begin
      read_data=mem[address];
    end
    else
    read_data=8'b00000000;
    
end

endmodule