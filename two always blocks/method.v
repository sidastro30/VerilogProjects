//
// module method(clk, rstn, in, out);
//
// input clk, rstn, in;
// output reg out;
// reg intermediate;
//
// always @(posedge clk , negedge rstn) begin
//     if (~rstn) intermediate <= 1'b0;
//     else intermediate <= in;
// end
//
// always @(posedge clk, negedge rstn) begin
//      if (~rstn) out <= 1'b0;
//     else out <= intermediate;
// end
//
// endmodule



module method(clk, rstn, in, out);

input clk, rstn, in;
output reg out;
reg intermediate;

always @(posedge clk , negedge rstn) begin
    if (~rstn) begin
       intermediate <= 1'b0;  // Notice non-Blocking assignment
       out          <= 1'b0;
    end else begin
       intermediate <= in;
       out          <= intermediate;
    end
end

endmodule
