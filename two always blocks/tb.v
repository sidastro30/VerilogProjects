

`timescale 1ns/1ps
module tb;

reg           clk;
reg           rstn;
reg           in;
wire          out;

method inst(.clk(clk), .rstn(rstn), .in(in), .out(out));

initial begin
clk   = 1'b0;
in    = 1'b0;
rstn = 1'b1;
#1;
rstn = 1'b0;
#2;
rstn = 1'b1;
#4;
in    = 1'b1;
#4;
#4;
#4;
$stop;
end

always #2 clk = ~clk;

endmodule
