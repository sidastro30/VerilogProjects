module Simple_Ram(data, addr, clk, q, wnr);

parameter width   = 4'd8;
parameter address = 3'd6; // 6 means 64 addresses
parameter depth   = 2**address;



input [width-1   : 0] data;
input [address-1 : 0] addr;
input wnr, clk;
output [width - 1:0] q;


	// Declare the RAM variable, an array of 64 x 8 bit size (depth x width)
	reg [width-1 :0] ram [depth-1 :0];

	// Variable to hold the registered read address
	reg [address-1 : 0] addr_reg;

	always @ (posedge clk)
	begin
		  if (wnr)
			  ram[addr]   <=   data;
		  else
		    addr_reg    <=   addr;
	 end
	assign q = ram[addr_reg];

endmodule
