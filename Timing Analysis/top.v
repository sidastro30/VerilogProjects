`timescale 1ns/1ps
module top( clka, clkb, q, d, count1);
input clka, clkb;
input  [3:0] d;
output [3:0] q;
output reg    [3:0] count1;

reg a;

initial a=1'b0;

always@(posedge clka) begin
    count1 <= count1 + 1'b1;
end

always@(posedge clkb) a = ~a;

assign q = (count1 > 4'd1 && a) ? d : 4'd0;

endmodule
