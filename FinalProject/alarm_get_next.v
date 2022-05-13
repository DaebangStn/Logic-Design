`timescale 1ns / 1ps

module alarm_get_next(
    input [3:0] alarm_now,
    input [9:0] alarm_act,
    output reg[3:0] alarm_next
    );

always@(*) case(alarm_now)
4'd0: alarm_next=0;
4'd1: casex(alarm_act)
	10'b0000000000: alarm_next=4'd0;
	10'b0000000001: alarm_next=4'd1;
	10'bxxxxxxxx1x: alarm_next=4'd2;
	10'bxxxxxxx10x: alarm_next=4'd3;
	10'bxxxxxx100x: alarm_next=4'd4;
	10'bxxxxx1000x: alarm_next=4'd5;
	10'bxxxx10000x: alarm_next=4'd6;
	10'bxxx100000x: alarm_next=4'd7;
	10'bxx1000000x: alarm_next=4'd8;
	10'bx10000000x: alarm_next=4'd9;
	10'b100000000x: alarm_next=4'd10;
	endcase
4'd2: casex(alarm_act)
	10'b0000000000: alarm_next=4'd0;
	10'b0000000010: alarm_next=4'd2;
	10'bxxxxxxx1xx: alarm_next=4'd3;
	10'bxxxxxx10xx: alarm_next=4'd4;
	10'bxxxxx100xx: alarm_next=4'd5;
	10'bxxxx1000xx: alarm_next=4'd6;
	10'bxxx10000xx: alarm_next=4'd7;
	10'bxx100000xx: alarm_next=4'd8;
	10'bx1000000xx: alarm_next=4'd9;
	10'b10000000xx: alarm_next=4'd10;
	10'b0000000001: alarm_next=4'd1;
	endcase
4'd3: casex(alarm_act)
	10'b0000000000: alarm_next=4'd0;
	10'b0000000100: alarm_next=4'd3;
	10'bxxxxxx1xxx: alarm_next=4'd4;
	10'bxxxxx10xxx: alarm_next=4'd5;
	10'bxxxx100xxx: alarm_next=4'd6;
	10'bxxx1000xxx: alarm_next=4'd7;
	10'bxx10000xxx: alarm_next=4'd8;
	10'bx100000xxx: alarm_next=4'd9;
	10'b1000000xxx: alarm_next=4'd10;
	10'b0000000xx1: alarm_next=4'd1;
	10'b0000000010: alarm_next=4'd2;
	endcase
4'd4: casex(alarm_act)
	10'b0000000000: alarm_next=4'd0;
	10'b0000001000: alarm_next=4'd4;
	10'bxxxxx1xxxx: alarm_next=4'd5;
	10'bxxxx10xxxx: alarm_next=4'd6;
	10'bxxx100xxxx: alarm_next=4'd7;
	10'bxx1000xxxx: alarm_next=4'd8;
	10'bx10000xxxx: alarm_next=4'd9;
	10'b100000xxxx: alarm_next=4'd10;
	10'b000000xxx1: alarm_next=4'd1;
	10'b000000xx10: alarm_next=4'd2;
	10'b0000000100: alarm_next=4'd3;
	endcase
4'd5: casex(alarm_act)
	10'b0000000000: alarm_next=4'd0;
	10'b0000010000: alarm_next=4'd5;
	10'bxxxx1xxxxx: alarm_next=4'd6;
	10'bxxx10xxxxx: alarm_next=4'd7;
	10'bxx100xxxxx: alarm_next=4'd8;
	10'bx1000xxxxx: alarm_next=4'd9;
	10'b10000xxxxx: alarm_next=4'd10;
	10'b00000xxxx1: alarm_next=4'd1;
	10'b00000xxx10: alarm_next=4'd2;
	10'b00000xx100: alarm_next=4'd3;
	10'b0000001000: alarm_next=4'd4;
	endcase
4'd6: casex(alarm_act)
	10'b0000000000: alarm_next=4'd0;
	10'b0000100000: alarm_next=4'd6;
	10'bxxx1xxxxxx: alarm_next=4'd7;
	10'bxx10xxxxxx: alarm_next=4'd8;
	10'bx100xxxxxx: alarm_next=4'd9;
	10'b1000xxxxxx: alarm_next=4'd10;
	10'b0000xxxxx1: alarm_next=4'd1;
	10'b0000xxxx10: alarm_next=4'd2;
	10'b0000xxx100: alarm_next=4'd3;
	10'b0000xx1000: alarm_next=4'd4;
	10'b0000010000: alarm_next=4'd5;
	endcase
4'd7: casex(alarm_act)
	10'b0000000000: alarm_next=4'd0;
	10'b0001000000: alarm_next=4'd7;
	10'bxx1xxxxxxx: alarm_next=4'd8;
	10'bx10xxxxxxx: alarm_next=4'd9;
	10'b100xxxxxxx: alarm_next=4'd10;
	10'b000xxxxxx1: alarm_next=4'd1;
	10'b000xxxxx10: alarm_next=4'd2;
	10'b000xxxx100: alarm_next=4'd3;
	10'b000xxx1000: alarm_next=4'd4;
	10'b000xx10000: alarm_next=4'd5;
	10'b0000100000: alarm_next=4'd6;
	endcase
4'd8: casex(alarm_act)
	10'b0000000000: alarm_next=4'd0;
	10'b0010000000: alarm_next=4'd8;
	10'bx1xxxxxxxx: alarm_next=4'd9;
	10'b10xxxxxxxx: alarm_next=4'd10;
	10'b00xxxxxxx1: alarm_next=4'd1;
	10'b00xxxxxx10: alarm_next=4'd2;
	10'b00xxxxx100: alarm_next=4'd3;
	10'b00xxxx1000: alarm_next=4'd4;
	10'b00xxx10000: alarm_next=4'd5;
	10'b00xx100000: alarm_next=4'd6;
	10'b0001000000: alarm_next=4'd7;
	endcase
4'd9: casex(alarm_act)
	10'b0000000000: alarm_next=4'd0;
	10'b0100000000: alarm_next=4'd9;
	10'b1xxxxxxxxx: alarm_next=4'd10;
	10'b0xxxxxxxx1: alarm_next=4'd1;
	10'b0xxxxxxx10: alarm_next=4'd2;
	10'b0xxxxxx100: alarm_next=4'd3;
	10'b0xxxxx1000: alarm_next=4'd4;
	10'b0xxxx10000: alarm_next=4'd5;
	10'b0xxx100000: alarm_next=4'd6;
	10'b0xx1000000: alarm_next=4'd7;
	10'b0010000000: alarm_next=4'd8;
	endcase
4'd10: casex(alarm_act)
	10'b0000000000: alarm_next=4'd0;
	10'b1000000000: alarm_next=4'd10;
	10'bxxxxxxxxx1: alarm_next=4'd1;
	10'bxxxxxxxx10: alarm_next=4'd2;
	10'bxxxxxxx100: alarm_next=4'd3;
	10'bxxxxxx1000: alarm_next=4'd4;
	10'bxxxxx10000: alarm_next=4'd5;
	10'bxxxx100000: alarm_next=4'd6;
	10'bxxx1000000: alarm_next=4'd7;
	10'bxx10000000: alarm_next=4'd8;
	10'b0100000000: alarm_next=4'd9;
	endcase

endcase
endmodule
