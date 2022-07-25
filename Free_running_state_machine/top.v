// Free running state machine

`timescale 1ps / 1ps
module top(clk,rst,out);

input clk, rst;
output reg [7:0] out;

reg [3:0]state;
reg [21:0] count;
reg clk1;

initial clk1 = 1'b0;
parameter  S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, S3 = 4'd3, S4 = 4'd4, S5 = 4'd5, S6 = 4'd6;

always@(posedge clk1 or negedge rst ) begin
  if(~rst) begin
     state   <=   S0;

  end else begin
     case(state)
     S0:   begin
            out   <= 8'b00000000;
            state <= S1;
           end
     S1:   begin
            out   <= 8'b00011000;
            state <= S2;
           end
     S2:   begin
            out   <= 8'b00111100;
            state <= S3;
           end
     S3:   begin
            out   <= 8'b01111110;
            state <= S4;
           end
     S4:   begin
            out   <= 8'b11100111;
            state <= S5;
           end
     S5:   begin
            out   <= 8'b11000011;
            state <= S6;
           end
     S6:   begin
            out   <= 8'b10000001;
            state <= S0;
           end
      default: state <= S0;
   endcase
  end
end


 always @ ( posedge clk ) begin
      count <= count + 1'b1;
      if (count > 22'd3000000) begin
         count <= 22'd0;
         clk1  <= ~clk1;
       end
 end
endmodule
