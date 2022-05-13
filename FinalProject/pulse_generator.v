`timescale 1ns / 1ps

module pulse_generator(
    input clk,
    input in,
    input rst,
    output out
    );

reg[1:0] s; reg[1:0] s_nxt;

assign out = (s==2'b01)? 1'b1:1'b0;

always @(*) case(s)
2'b00: s_nxt = (in==1'b1)?2'b01:2'b00;
2'b11: s_nxt = (in==1'b1)?2'b11:2'b00;
2'b01: s_nxt = (in==1'b1)?2'b11:2'b00;
endcase

always @(posedge clk) 
s <= (rst==1'b1)?2'b00:s_nxt;

endmodule
