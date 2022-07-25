`timescale 1ns/1ps

module counter(clk, counter_out);
input clk;
output reg [3:0]counter_out;

initial begin 
   counter_out =  4'b0000;
end

always@(posedge clk)   counter_out  <=   counter_out + 1'b1;
 
endmodule 
