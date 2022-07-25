`timescale 1ps/1ps
module top(ina,inb, outa, sel);
input [1:0] ina, inb, sel;
output [4:0] outa;
wire [4:0] outa_exp, outa_and, outa_cat, outa_mult;

exp1 inst_exp    (.ina(ina),
                  .outa(outa_exp)
                   );


and1 inst_and     (.ina(ina),
                   .inb(inb),
                   .outa(outa_and)
                   );


cat1 inst_cat       (.ina(ina),
                     .inb(inb),
                     .outa(outa_cat)
                    );

mult1 inst_mult (.dataa(ina), .datab(inb), .result(outa_mult));


mux1  inst_mux1 (  .data0x(outa_mult),  .data1x(outa_cat),  .data2x(outa_exp),  .data3x(outa_and),  .sel(sel),  .result(outa) );


endmodule
