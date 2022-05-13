`timescale 1ns / 1ps

module clock_modulator_20000(
    input clk_in,
    output reg clk_out
    );

reg[13:0] cnt = 0;

always @(posedge clk_in)
if(cnt == 14'd9999) // 7058 
begin cnt=0; clk_out=~clk_out; end 
else cnt = cnt+1;

endmodule
