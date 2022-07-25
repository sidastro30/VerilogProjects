`timescale 1ns/1ps

module d_flip_flop_tb;
reg clk;
reg d;
wire q; 

// Calling Device Under Test
d_flip_flop      instance_name (.clk(clk), .d(d), .q(q));

initial 
  begin
     clk = 1'b0;
     d = 1'b1;
     #3;
     d = 1'b0;
     #3;
     d = 1'b1; 
     #5;
     $stop;
end 

always  #1 clk  = ~clk;

endmodule
