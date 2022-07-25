`timescale 1ps / 1ps
module bench();
reg     clk, rst, start;
reg     in1;      //
reg     in2;      //
reg     in3;      //
wire    ctrl1;    //
wire    ctrl2;    //
wire    ctrl3;    //
wire    fault;
wire    normal_start;  //

multi_control_state_machine  inst  ( .clk          (clk),
                                     .start        (start),
                                     .rst          (rst),
                                     .in1          (in1),
                                     .in2          (in2),
                                     .in3          (in3),
                                     .ctrl1        (ctrl1),
                                     .ctrl2        (ctrl2),
                                     .ctrl3        (ctrl3),
                                     .fault        (fault),
                                     .normal_start (normal_start));

initial begin
rst   = 1'b0;
clk   = 1'b0;
start = 1'b0;
#2;
rst   = 1'b1;
#10;
start = 1'b1;
#60;
rst = 1'b0;
#4;
rst = 1'b1;
#30;
rst = 1'b0;
#4;
rst = 1'b1;
#70;
$stop;
end

always  @(ctrl1) begin
        if (ctrl1)   #4 in1 = 1'b1 ;
        else            in1 = 1'b0;
        end

always  @(ctrl2) begin
        if (ctrl2)   #4 in2 = 1'b1;
        else            in2 = 1'b0;
        end

always @ (ctrl3) begin
  if(ctrl3) begin
        in3 = 1'b1;
        #20;
        in3 = 1'b0;
  end else in3 = 1'b0;
end

always #1 clk = ~clk;

endmodule //bench
