`timescale 1ns/1ps

module d_flip_flop(clk, d, q);

input clk, d;
output reg q;

always@(posedge clk) begin 
   if(d == 1'b0)
	   q <= 1'b1;
	 else 
	   q <= 1'b0;

end 

endmodule
