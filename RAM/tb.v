`timescale 1ns / 1ps

module tb;

reg [7:0]data;
reg [5:0]addr;
reg clk;
wire [7:0]q;
reg  wnr;
integer i;
Simple_Ram ram_inst(.data(data), .addr(addr), .clk(clk), .q(q), .wnr(wnr));

initial begin
addr = 6'd0;
wnr  = 1'd1;
data = 8'd2;
clk  = 1'b0;

for (i = 0; i < 64 ; i = i + 1) begin
#2;
data = data + 1'b1;
addr = addr + 1'b1;
#2;
end

wnr  =  1'd0;
addr = 'd0;

for ( i = 0; i < 64 ; i = i + 1) begin
#2;
addr = addr + 1'b1;
#2;
end
$stop;
end
always #1 clk = ~clk;
endmodule
