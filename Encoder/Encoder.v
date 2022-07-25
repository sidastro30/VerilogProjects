module encoder(in,out);

input [3:0] in;
output reg [7:0] out;

wire [3:0]remainder_10;

assign remainder_10 = in % 4'd10;


always@(in) begin
    if(in <= 4'd9)   out = {4'd0,in};
    else             out = {4'b0001, remainder_10};
end

endmodule
