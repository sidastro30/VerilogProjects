module gateinst (clk, ctrl1, ctrl2,data_in, out);
input clk;
input ctrl1, ctrl2;
input data_in;
output out;

and inst1(wire_1_out, ctrl1, ctrl2);
xor inst2(wire_2_out, ctrl1, ctrl2);
or  inst3(wire_3_out, wire_1_out, wire_2_out);

bufif1 inst4 (out1, data_in, wire_3_out);
dff inst5 (out,out1,clk);

endmodule