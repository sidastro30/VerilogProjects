`timescale 1ns/1ps
module adder_tb;

reg [3:0]a,b;
reg cin;
wire carryout;
wire [3:0]sum;

four_bit_adder inst(.a(a),.b(b),.cin(cin),.carryout(carryout),.sum(sum));

initial  begin
cin = 1'b0;
#10;
a = 4'b0010;
b = 4'b0010;
#10;
a = 4'b0011;
b = 4'b0011;
#10;
a = 4'b1000;
b = 4'b0010;
#10;

end
endmodule