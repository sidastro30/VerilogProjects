
module mac(in, clk, rst_n, out);

input                     clk;
input                   rst_n;
input               [7:0] in;
output   reg [31:0] out;

wire [31:0] out_next;

always @(posedge clk or negedge rst_n)
    out = (rst_n) ? out_next : 0;

assign out_next = out + (in * 2);

endmodule