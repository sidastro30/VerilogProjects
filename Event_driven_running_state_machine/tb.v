`timescale 1ps / 1ps
module bench();
reg clk, in;
wire [7:0] out;

top inst( .clk(clk),  .in(in),  .out(out));

initial begin

  in  = 1'b1;
  clk = 1'b1;
  #20;
  in = 1'b0;
  #20;
$stop;
end

always #1 clk = ~clk;
endmodule //tb
