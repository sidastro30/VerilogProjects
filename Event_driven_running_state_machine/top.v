// Free running state machine

`timescale 1ps / 1ps
module top(clk,in,out);

input clk, in;
output reg [7:0] out;

reg [3:0]  state;
reg [22:0] count;
reg clk1;

initial clk1 = 1'b0;
parameter  S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, S3 = 4'd3, S4 = 4'd4, S5 = 4'd5, S6 = 4'd6;

always@(posedge clk1) begin
     case(state)
     S0:   begin
            out   <= 8'b00000000;
            if (in == 1'b0) state <= S1;  // This will infer latch, which can be neglected safely
           end
     S1:   begin
            out   <= 8'b00011000;
            if (in == 1'b0) state <= S2;  // This will infer latch, which can be neglected safely
            else state = S1;
           end
     S2:   begin
            out   <= 8'b00111100;
            if (in == 1'b0) state <= S3;  // This will infer latch, which can be neglected safely
           end
     S3:   begin
            out   <= 8'b01111110;
            if (in == 1'b0) state <= S4;  // This will infer latch, which can be neglected safely
           end
     S4:   begin
            out   <= 8'b11100111;
            if (in == 1'b0) state <= S5;  // This will infer latch, which can be neglected safely
           end
     S5:   begin
            out   <= 8'b11000011;
            if (in == 1'b0) state <= S6;  // This will infer latch, which can be neglected safely
           end
     S6:   begin
            out   <= 8'b10000001;
            if (in == 1'b0) state <= S0;  // This will infer latch, which can be neglected safely
           end
      default: state <= S3;
   endcase
end


 always @ ( posedge clk ) begin
      count <= count + 1'b1;
      if (count > 23'd3000000) begin
         count <= 23'd0;
         clk1  <= ~clk1;
       end
 end
endmodule
