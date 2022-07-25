
`timescale 1ns/1ps
module tb;

reg           clk;
reg           rst_n;
reg     [7:0] in;
wire   [31:0] out;

mac inst(.in(in), .clk(clk), .rst_n(rst_n), .out(out));

initial begin
clk   = 1'b0;
in    = 8'h00;
rst_n = 1'b1;
#1;
rst_n = 1'b0;
#2;
rst_n = 1'b1;
#4;
in    = 8'h02;
#4;
in    = 8'h01;
#4;
in    = 8'h04;
#10;
$stop;
end

always #2 clk = ~clk;

endmodule
