module tb;

reg  [3:0] in;
wire [7:0] out;

encoder inst (.in(in),.out(out));

initial begin
in = 4'd2;
#5;
in = 4'd2;
#5;
in = 4'd15;
#5;
in = 4'd6;
#5;
in = 4'd13;
#5;
in = 4'd0;
#5;
end

endmodule
