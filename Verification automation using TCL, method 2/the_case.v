module the_case (input [1:0] a, b, funct, output reg [4:0] out);

always @(a,b,funct) begin
case (funct)
        2'b00   :  out = a + b;   // Each case choice is a different system state
        2'b01   :  out = a - b;
        2'b10   :  out = a * b;
        2'b11   :  out = a**b;  // Power operator equivalent to ab
       default  :  out = a + b;
endcase
end
endmodule
