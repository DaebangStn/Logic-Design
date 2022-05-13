`timescale 1ns / 1ps

module clock_alarm(
    input clk_time,
    input clk_tick,
	 input rst,
	 input mode,
	 input set,
	 input disp_up,
	 input down_clear,
	 input next,
	 input [1:0] st_mux,
	 input [9:0] alarm_act,
	 input [6:0] sec_now,
	 input [6:0] min_now,
	 input [6:0] hour_now,
	 output reg alarmed,
	 output reg[6:0] seg1,
	 output reg[6:0] seg2,
	 output reg[6:0] seg3,
	 output reg[6:0] seg4,
	 output reg[6:0] seg5,
	 output reg[6:0] seg6,
	 output reg[3:0] st, // bit0:24/12, bit1~2: set_xxx
	 output reg[3:0] alarm_now // 0 for invalid alarm
    );

reg[9:0] alarm_set; reg disp_null;
reg[6:0]hour1; reg[6:0]min1; reg[6:0]hour6; reg[6:0]min6;
reg[6:0]hour2; reg[6:0]min2; reg[6:0]hour7; reg[6:0]min7;
reg[6:0]hour3; reg[6:0]min3; reg[6:0]hour8; reg[6:0]min8;
reg[6:0]hour4; reg[6:0]min4; reg[6:0]hour9; reg[6:0]min9;
reg[6:0]hour5; reg[6:0]min5; reg[6:0]hour10; reg[6:0]min10;

wire[6:0]_seg1_24;wire[6:0]_seg2_24;wire[6:0]_seg3_24;
wire[6:0]_seg4_24;wire[6:0]_seg5_24;wire[6:0]_seg6_24;
wire[6:0]_seg1_12;wire[6:0]_seg2_12;wire[6:0]_seg3_12;
wire[6:0]_seg4_12;wire[6:0]_seg5_12;wire[6:0]_seg6_12;

parameter mux_alarm = 2'b01;
parameter set_none = 2'b00; parameter set_ap = 2'b01;
parameter set_hour = 2'b10; parameter set_min = 2'b11;
parameter seg_null = 7'b0000001; parameter seg_zero = 7'b1111110;
parameter seg_A = 7'b1110111; parameter seg_P = 7'b1100111;

wire[6:0] _hour_12; reg[6:0] _hour; reg[6:0] _min;
assign _hour_12=(_hour>12)?(_hour-12):_hour;

assign _seg1_12 = (_hour>12)?seg_P:seg_A;
assign _seg2_12=0;
segment_decoder_2 D1_12(_hour, 1, _seg3_12, _seg4_12);
segment_decoder_2 D2_12(_min, 1, _seg5_12, _seg6_12);

segment_decoder_2 D1_24(_hour, 1, _seg1_24, _seg2_24);
segment_decoder_2 D2_24(_min, 1, _seg3_24, _seg4_24);
assign _seg5_24=seg_zero; assign _seg6_24=seg_zero;

wire[3:0] alarm_next;
alarm_get_next N(alarm_now, alarm_act, alarm_next);

always@(posedge clk_tick) begin
if(rst) begin
alarm_now=0; alarm_set=0;
hour1=0;min1=0;hour6=0;min6=0;
hour2=0;min2=0;hour7=0;min7=0;
hour3=0;min3=0;hour8=0;min8=0;
hour4=0;min4=0;hour9=0;min9=0;
hour5=0;min5=0;hour10=0;min10=0;
alarmed=0;
end

else if((st_mux==mux_alarm)&&set) begin if(alarm_now!=0) case(st[2:1])
set_none: st[2:1]=(st[0])?set_ap:set_hour;
set_ap: st[2:1]=set_hour;
set_hour: st[2:1]=set_min;
set_min: st[2:1]=set_none;
endcase
case(alarm_now)
4'd1: begin 
hour1=(alarm_set[0])?hour1:hour_now;
min1=(alarm_set[0])?min1:min_now;
alarm_set[0]=1; end
4'd2: begin 
hour2=(alarm_set[1])?hour2:hour_now;
min2=(alarm_set[1])?min2:min_now;
alarm_set[1]=1; end
4'd3: begin 
hour3=(alarm_set[2])?hour3:hour_now;
min3=(alarm_set[2])?min3:min_now;
alarm_set[2]=1; end
4'd4: begin 
hour4=(alarm_set[3])?hour4:hour_now;
min4=(alarm_set[3])?min4:min_now;
alarm_set[3]=1; end
4'd5: begin 
hour5=(alarm_set[4])?hour5:hour_now;
min5=(alarm_set[4])?min5:min_now;
alarm_set[4]=1; end
4'd6: begin 
hour6=(alarm_set[5])?hour6:hour_now;
min6=(alarm_set[5])?min6:min_now;
alarm_set[5]=1; end
4'd7: begin 
hour7=(alarm_set[6])?hour7:hour_now;
min7=(alarm_set[6])?min7:min_now;
alarm_set[6]=1; end
4'd8: begin 
hour8=(alarm_set[7])?hour8:hour_now;
min8=(alarm_set[7])?min8:min_now;
alarm_set[7]=1; end
4'd9: begin 
hour9=(alarm_set[8])?hour9:hour_now;
min9=(alarm_set[8])?min9:min_now;
alarm_set[8]=1; end
4'd10: begin 
hour10=(alarm_set[9])?hour10:hour_now;
min10=(alarm_set[9])?min10:min_now;
alarm_set[9]=1; end
endcase
end
else if((st_mux==mux_alarm)&&disp_up) begin case(st[2:1])
set_none: st[0]=~st[0];
set_ap: case(alarm_now)
	4'd1: hour1=(hour1>12)?hour1-12:hour1+12;
	4'd2: hour2=(hour2>12)?hour2-12:hour2+12;
	4'd3: hour3=(hour3>12)?hour3-12:hour3+12;
	4'd4: hour4=(hour4>12)?hour4-12:hour4+12;
	4'd5: hour5=(hour5>12)?hour5-12:hour5+12;
	4'd6: hour6=(hour6>12)?hour6-12:hour6+12;
	4'd7: hour7=(hour7>12)?hour7-12:hour7+12;
	4'd8: hour8=(hour8>12)?hour8-12:hour8+12;
	4'd9: hour9=(hour9>12)?hour9-12:hour9+12;
	4'd10: hour10=(hour10>12)?hour10-12:hour10+12;
	endcase
set_hour: case(alarm_now)
	4'd1: hour1=(hour1==23)?0:hour1+1;
	4'd2: hour2=(hour2==23)?0:hour2+1;
	4'd3: hour3=(hour3==23)?0:hour3+1;
	4'd4: hour4=(hour4==23)?0:hour4+1;
	4'd5: hour5=(hour5==23)?0:hour5+1;
	4'd6: hour6=(hour6==23)?0:hour6+1;
	4'd7: hour7=(hour7==23)?0:hour7+1;
	4'd8: hour8=(hour8==23)?0:hour8+1;
	4'd9: hour9=(hour9==23)?0:hour9+1;
	4'd10: hour10=(hour10==23)?0:hour10+1;
	endcase
set_min: case(alarm_now)
	4'd1: min1=(min1==59)?0:min1+1;
	4'd2: min2=(min2==59)?0:min2+1;
	4'd3: min3=(min3==59)?0:min3+1;
	4'd4: min4=(min4==59)?0:min4+1;
	4'd5: min5=(min5==59)?0:min5+1;
	4'd6: min6=(min6==59)?0:min6+1;
	4'd7: min7=(min7==59)?0:min7+1;
	4'd8: min8=(min8==59)?0:min8+1;
	4'd9: min9=(min9==59)?0:min9+1;
	4'd10: min10=(min10==59)?0:min10+1;
	endcase
endcase end
else if((st_mux==mux_alarm)&&down_clear) begin case(st[2:1])
set_none: case(alarm_now)
	4'd1: alarm_set[0]=0;
	4'd2: alarm_set[1]=0;
	4'd3: alarm_set[2]=0;
	4'd4: alarm_set[3]=0;
	4'd5: alarm_set[4]=0;
	4'd6: alarm_set[5]=0;
	4'd7: alarm_set[6]=0;
	4'd8: alarm_set[7]=0;
	4'd9: alarm_set[8]=0;
	4'd10: alarm_set[9]=0;
	endcase
set_ap: case(alarm_now)
	4'd1: hour1=(hour1>12)?hour1-12:hour1+12;
	4'd2: hour2=(hour2>12)?hour2-12:hour2+12;
	4'd3: hour3=(hour3>12)?hour3-12:hour3+12;
	4'd4: hour4=(hour4>12)?hour4-12:hour4+12;
	4'd5: hour5=(hour5>12)?hour5-12:hour5+12;
	4'd6: hour6=(hour6>12)?hour6-12:hour6+12;
	4'd7: hour7=(hour7>12)?hour7-12:hour7+12;
	4'd8: hour8=(hour8>12)?hour8-12:hour8+12;
	4'd9: hour9=(hour9>12)?hour9-12:hour9+12;
	4'd10: hour10=(hour10>12)?hour10-12:hour10+12;
	endcase
set_hour: case(alarm_now)
	4'd1: hour1=(hour1==0)?23:hour1-1;
	4'd2: hour2=(hour2==0)?23:hour2-1;
	4'd3: hour3=(hour3==0)?23:hour3-1;
	4'd4: hour4=(hour4==0)?23:hour4-1;
	4'd5: hour5=(hour5==0)?23:hour5-1;
	4'd6: hour6=(hour6==0)?23:hour6-1;
	4'd7: hour7=(hour7==0)?23:hour7-1;
	4'd8: hour8=(hour8==0)?23:hour8-1;
	4'd9: hour9=(hour9==0)?23:hour9-1;
	4'd10: hour10=(hour10==0)?23:hour10-1;
	endcase
set_min: case(alarm_now)
	4'd1: min1=(min1==0)?59:min1-1;
	4'd2: min2=(min2==0)?59:min2-1;
	4'd3: min3=(min3==0)?59:min3-1;
	4'd4: min4=(min4==0)?59:min4-1;
	4'd5: min5=(min5==0)?59:min5-1;
	4'd6: min6=(min6==0)?59:min6-1;
	4'd7: min7=(min7==0)?59:min7-1;
	4'd8: min8=(min8==0)?59:min8-1;
	4'd9: min9=(min9==0)?59:min9-1;
	4'd10: min10=(min10==0)?59:min10-1;
	endcase
	
endcase end
else if((st_mux==mux_alarm)&&next) begin
alarm_now=alarm_next;
end

case(alarm_now)
4'd0: begin casex(alarm_act) // no current alarm
	10'b0000000000: alarm_now=4'b0000;
	10'bxxxxxxxxx1: alarm_now=4'b0001;
	10'bxxxxxxxx10: alarm_now=4'b0010;
	10'bxxxxxxx100: alarm_now=4'b0011;
	10'bxxxxxx1000: alarm_now=4'b0100;
	10'bxxxxx10000: alarm_now=4'b0101;
	10'bxxxx100000: alarm_now=4'b0110;
	10'bxxx1000000: alarm_now=4'b0111;
	10'bxx10000000: alarm_now=4'b1000;
	10'bx100000000: alarm_now=4'b1001;
	10'b1000000000: alarm_now=4'b1010;
	endcase 
	disp_null=1;
	end
4'd1: begin 
	_hour=hour1; _min=min1;
	disp_null=(alarm_set[0])?0:1; 
	alarm_now=(alarm_act[0])?alarm_now:0; end
4'd2: begin 
	_hour=hour2; _min=min2;
	disp_null=(alarm_set[1])?0:1; 
	alarm_now=(alarm_act[1])?alarm_now:0; end
4'd3: begin 
	_hour=hour3; _min=min3;
	disp_null=(alarm_set[2])?0:1; 
	alarm_now=(alarm_act[2])?alarm_now:0; end
4'd4: begin 
	_hour=hour4; _min=min4;
	disp_null=(alarm_set[3])?0:1; 
	alarm_now=(alarm_act[3])?alarm_now:0; end
4'd5: begin 
	_hour=hour5; _min=min5;
	disp_null=(alarm_set[4])?0:1; 
	alarm_now=(alarm_act[4])?alarm_now:0; end
4'd6: begin 
	_hour=hour6; _min=min6;
	disp_null=(alarm_set[5])?0:1; 
	alarm_now=(alarm_act[5])?alarm_now:0; end
4'd7: begin 
	_hour=hour7; _min=min7;
	disp_null=(alarm_set[6])?0:1; 
	alarm_now=(alarm_act[6])?alarm_now:0; end
4'd8: begin 
	_hour=hour8; _min=min8;
	disp_null=(alarm_set[7])?0:1; 
	alarm_now=(alarm_act[7])?alarm_now:0; end
4'd9: begin 
	_hour=hour9; _min=min9;
	disp_null=(alarm_set[8])?0:1; 
	alarm_now=(alarm_act[8])?alarm_now:0; end
4'd10: begin 
	_hour=hour10; _min=min10;
	disp_null=(alarm_set[9])?0:1; 
	alarm_now=(alarm_act[9])?alarm_now:0; end
endcase

if(sec_now == 0) begin
	if(alarm_set[0]&&alarm_act[0]&&(min1==min_now)&&(hour1==hour_now)) alarmed=1;
	if(alarm_set[1]&&alarm_act[1]&&(min2==min_now)&&(hour2==hour_now)) alarmed=1;
	if(alarm_set[2]&&alarm_act[2]&&(min3==min_now)&&(hour3==hour_now)) alarmed=1;
	if(alarm_set[3]&&alarm_act[3]&&(min4==min_now)&&(hour4==hour_now)) alarmed=1;
	if(alarm_set[4]&&alarm_act[4]&&(min5==min_now)&&(hour5==hour_now)) alarmed=1;
	if(alarm_set[5]&&alarm_act[5]&&(min6==min_now)&&(hour6==hour_now)) alarmed=1;
	if(alarm_set[6]&&alarm_act[6]&&(min7==min_now)&&(hour7==hour_now)) alarmed=1;
	if(alarm_set[7]&&alarm_act[7]&&(min8==min_now)&&(hour8==hour_now)) alarmed=1;
	if(alarm_set[8]&&alarm_act[8]&&(min9==min_now)&&(hour9==hour_now)) alarmed=1;
	if(alarm_set[9]&&alarm_act[9]&&(min10==min_now)&&(hour10==hour_now)) alarmed=1;
end
else alarmed=0;

if(disp_null) begin
seg1=seg_null; seg2=seg_null;
seg3=seg_null; seg4=seg_null;
seg5=seg_null; seg6=seg_null;
end
else begin
seg1=(st[0])?_seg1_12:_seg1_24;
seg2=(st[0])?_seg2_12:_seg2_24;
seg3=(st[0])?_seg3_12:_seg3_24;
seg4=(st[0])?_seg4_12:_seg4_24;
seg5=(st[0])?_seg5_12:_seg5_24;
seg6=(st[0])?_seg6_12:_seg6_24;
end

end
endmodule
