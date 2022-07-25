module four_bit_adder(a,b,cin,carryout,sum);

input  [3:0]a,b;
input  cin;
output carryout;
output [3:0] sum;
wire   carryout0, carryout1, carryout2;

full_adder inst0(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.carryout(carryout0));
full_adder inst1(.a(a[1]),.b(b[1]),.cin(carryout0),.sum(sum[1]),.carryout(carryout1));
full_adder inst2(.a(a[2]),.b(b[2]),.cin(carryout1),.sum(sum[2]),.carryout(carryout2));
full_adder inst3(.a(a[3]),.b(b[3]),.cin(carryout2),.sum(sum[3]),.carryout(carryout));

endmodule