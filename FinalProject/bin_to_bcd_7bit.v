`timescale 1ns / 1ps

module bin_to_bcd_7bit(
    input [6:0] in,
    output [3:0] out0,
    output [3:0] out1
    );

wire[3:0] c1; wire[3:0] c2; wire[3:0] c3;
wire[3:0] c4; wire[3:0] c5;

assign c1 = ({0,in[6:4]}>=4'd5)?({0,in[6:4]}+3):{0,in[6:4]};
assign c2 = ({c1[2:0],in[3]}>=4'd5)?({c1[2:0],in[3]}+3):{c1[2:0],in[3]};
assign c3 = ({c2[2:0],in[2]}>=4'd5)?({c2[2:0],in[2]}+3):{c2[2:0],in[2]};
assign c4 = ({c3[2:0],in[1]}>=4'd5)?({c3[2:0],in[1]}+3):{c3[2:0],in[1]};
assign c5 = ({0,c1[3],c2[3],c3[3]}>=4'd5)?({0,c1[3],c2[3],c3[3]}+3):{0,c1[3],c2[3],c3[3]};

assign out0 = {c4[2:0], in[0]};
assign out1 = {c5[2:0], c4[3]};

endmodule
