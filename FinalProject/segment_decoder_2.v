`timescale 1ns / 1ps

module segment_decoder_2(
    input [6:0] number,
    input set_lead0, // 1 to disp leading 0
    output [6:0] seg1,
    output [6:0] seg0
    );
wire [3:0] order0; wire [3:0] order1;
wire [6:0] _seg1;

bin_to_bcd_7bit U1(number, order0, order1);
segment_decoder U2(order0, seg0);
segment_decoder U3(order1, _seg1);

assign seg1=(~set_lead0&&(order1==0))?0:_seg1;

endmodule
