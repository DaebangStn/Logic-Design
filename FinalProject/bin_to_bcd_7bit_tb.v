`timescale 1ns / 1ps

module bin_to_bcd_7bit_tb;

	// Inputs
	reg [6:0] in;

	// Outputs
	wire [3:0] out0;
	wire [3:0] out1;

	// Instantiate the Unit Under Test (UUT)
	bin_to_bcd_7bit uut (
		.in(in), 
		.out0(out0), 
		.out1(out1)
	);

	initial in = 0;
	
	always  #10 in=in+1;
      
endmodule

