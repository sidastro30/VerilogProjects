`timescale 1ps/1ps

module tb;
reg [1:0]ina, inb, sel;
wire [4:0]outa;

top inst (.ina(ina),  .inb(inb),   .outa(outa),   .sel(sel));

initial begin

ina = 2'd2;
inb = 2'd3;
sel = 2'd0; // Multiplier is selected
#6;
sel = 2'd1; // cat operation is selected
#6;
sel = 2'd2; // exp is selected
#6;
sel = 2'd3; // & is selected
#6;
ina = 2'd3;
inb = 2'd3;
sel = 2'd0; // Multiplier is selected
#6;
sel = 2'd1; // cat operation is selected
#6;
sel = 2'd2; // exp is selected
#6;
sel = 2'd3; // & is selected
#6;
$stop;
end


endmodule
