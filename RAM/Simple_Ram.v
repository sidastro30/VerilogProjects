// Simple, single port RAM

module Simple_Ram(data, addr, clk, q,wnr);

input [7:0] data;
input [5:0] addr;
input wnr, clk;
output [7:0] q;


	// Declare the RAM variable, an array of 64 x 8 bit size (depth x width)
	reg [7:0] ram [63:0];

	// Variable to hold the registered read address
	reg [5:0] addr_reg;

	always @ (posedge clk)
	begin
		  if (wnr)
			  ram[addr]   <=   data;
		  else
		    addr_reg    <=   addr;
	 end
	assign q = ram[addr_reg];

endmodule
