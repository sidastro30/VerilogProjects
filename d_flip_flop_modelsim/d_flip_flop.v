
`timescale 1ns/1ps

// Here 1ns means #1 = 1ns.

/* This is how multi line 
Comment looks like*/

module d_flip_flop(clk, d, q);

input clk, d;
output reg q; // ignore 

always@(posedge clk) begin 
   if(d == 1'b1)
       q <= 1'b1;
   else 
       q <= 1'b0;
end 
endmodule   

