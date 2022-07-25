
`timescale 1ns/1ps
module counter_tb;
reg            clk;
wire [3:0]counter_out;
counter  counter_inst(   .clk(clk),   .counter_out(counter_out));
initial begin
clk = 1'b0;
#40;
end
always #1 clk = ~clk;
endmodule


