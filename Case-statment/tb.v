// Test bench
`timescale 1ns / 1ps

module tb;

reg   [1:0] a,b,funct;
wire  [4:0] out;

the_case inst( .a(a), .b(b), .funct(funct), .out(out));

initial begin
a = 2'd3;
b = 2'd2;
funct = 2'd0;
#4;
$display(" The value of functionality is %b",funct);  // Display functionality with character display
repeat (2) begin
     funct = 2'd2;
     $display(" The value of functionality is %b",funct);
     #4;
     funct = 2'd1;
     $display(" The value of functionality is %b",funct);
     #4;
  end
#4;
funct = 2'd3;
$display(" The value of functionality is %b",funct);
#4;
funct = 2'dx;
$display(" The value of functionality is %b",funct);
#4;
end
// The comment
endmodule
