`timescale 1ps / 1ps
module tb ();
reg clk, rst;
wire [7:0] out;

top inst(.clk(clk), .rst(rst), .out(out));

initial begin
rst = 1'b1;
clk = 1'b1;
#4;
rst = 1'b0;
#4;
rst = 1'b1;
#100;
$stop;
end

always #1 clk = ~clk;
endmodule //tb
