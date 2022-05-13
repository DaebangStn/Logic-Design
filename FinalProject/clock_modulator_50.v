`timescale 1ns / 1ps

module clock_modulator_50(
    input clk_in,
    output reg clk_out
    );
	 
reg[5:0] cnt = 0;

always @(posedge clk_in)
if(cnt == 6'd24) 
begin cnt=0; clk_out=~clk_out; end 
else cnt = cnt+1;

endmodule
