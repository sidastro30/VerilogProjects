// Produces AND
module exp1(ina, outa);

input [1:0] ina;
output [4:0] outa;

assign outa = ina ** 2;

endmodule

//---------------------------------------------
// Ands
module and1(ina,inb,outa);

input [1:0]ina,inb;
output [4:0] outa;

assign outa = {3'b000,(ina & inb)};

endmodule

//---------------------------------------------
// Concatinates
module cat1(ina,inb,outa);

input [1:0]ina,inb;
output [4:0] outa;

assign outa = {1'b0,ina,inb};

endmodule
