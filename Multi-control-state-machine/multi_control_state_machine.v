// Free running state machine

`timescale 1ps / 1ps
module multi_control_state_machine(clk, start, rst, in1, in2, in3, ctrl1, ctrl2, ctrl3, fault, normal_start);

input       clk, rst, start;
input       in1;      // input from remote unit 1
input       in2;      // input from remote unit 2
input       in3;      // input from remote unit 3
output reg  ctrl1,    // out to remote unit 1
            ctrl2,    // out to remote unit 2
            ctrl3;    // out to remote unit 3
output reg  fault;
output reg  normal_start;  // Normal state took place


reg count_start;
reg [3:0] count;
reg [3:0] state;


parameter  IDLE    =              4'h0,
           INITIAL =              4'h1,
           FIRST_CTROLLER_ON =    4'h2,
           SECOND_CONTROLLER_ON = 4'h3,
           THIRD_CONTROLLER_ON =  4'h4,
           NORMAL_START =         4'h5,
           FAULT =                4'h6;

initial count_start = 1'b0;

always@(posedge clk) begin
     if (~rst) state <= IDLE;
     else begin
     case(state)

        IDLE:                  begin
                                count_start   <= 1'b0;
                                ctrl1         <= 1'b0;
                                ctrl2         <= 1'b0;
                                ctrl3         <= 1'b0;
                                normal_start  <= 1'b0;
                                fault         <= 1'b0;
                                if(start) state <= INITIAL;
                               end

        INITIAL:               begin
                               count_start   <= 1'b1;
                               if (count > 4'h7) begin
                                 state       <= FIRST_CTROLLER_ON;
                                 count_start <= 1'b0;
                                 end
                               end

        FIRST_CTROLLER_ON:     begin
                               ctrl1                      <=  1'b1;
                               if(~rst) state             <=  IDLE;
                               else if(in1 == 1'b1) state <=  SECOND_CONTROLLER_ON;
                               end

        SECOND_CONTROLLER_ON:  begin
                               ctrl2                         <=  1'b1;
                               if(~rst) state                <=  IDLE;
                               else if (in1 == 1'b0) state   <=  FAULT;
                               else if (in2 == 1'b1) state   <= THIRD_CONTROLLER_ON;
                               end

        THIRD_CONTROLLER_ON :  begin
                               ctrl3                                     <=  1'b1;
                               if(~rst) state                            <=  IDLE;
                               else if (in1 == 1'b0 | in2 == 1'b0) state <=  FAULT;
                               else if (in3 == 1'b1) state               <= NORMAL_START;
                               end

        NORMAL_START        :  begin
                               normal_start                                             <=  1'b1;
                               if(~rst) state                                           <=  IDLE;
                               else if (in1 == 1'b0 | in2 == 1'b0 | in3 == 1'b0) state  <=  FAULT;
                               end

        FAULT               :  begin
                               fault           <=  1'b1;
                               ctrl1           <=  1'b0;
                               ctrl2           <=  1'b0;
                               ctrl3           <=  1'b0;
                               normal_start    <=  1'b0;
                               if(~rst) state  <=  IDLE;
                               end

                   default   :  state  <= IDLE;
   endcase
   end
end


 always @ ( posedge clk or negedge rst) begin
     if(~rst)              count  <=   4'h0;
     else if (count_start) count  <=   count + 1'b1;
     else                  count  <=   'd0;
 end
endmodule
