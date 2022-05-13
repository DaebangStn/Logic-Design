`timescale 1ns / 1ps

module display_driver(
    input clk_time,
    input clk_tick,
    input rst,
    input mode,
    input[3:0] st_core,
    input[3:0] st_alarm,
	 input[3:0] alarm_now,
	 input alarmed_,
	 input clear,
	 input snooze,
	 input [6:0] sec_now,
	 input [6:0] min_now,
	 input [6:0] hour_now,
    input[6:0] seg1_core,
    input[6:0] seg2_core,
    input[6:0] seg3_core,
    input[6:0] seg4_core,
    input[6:0] seg5_core,
    input[6:0] seg6_core,
    input[6:0] seg1_alarm,
    input[6:0] seg2_alarm,
    input[6:0] seg3_alarm,
    input[6:0] seg4_alarm,
    input[6:0] seg5_alarm,
    input[6:0] seg6_alarm,
    input[6:0] seg1_stop,
    input[6:0] seg2_stop,
    input[6:0] seg3_stop,
    input[6:0] seg4_stop,
    input[6:0] seg5_stop,
    input[6:0] seg6_stop,
    output reg[6:0] seg1,
    output reg[6:0] seg2,
    output reg[6:0] seg3,
    output reg[6:0] seg4,
    output reg[6:0] seg5,
    output reg[6:0] seg6,
	 output reg[1:0] st_mux,
	 output reg[3:0] leds
    );

reg alarmed; reg snooze_set;
reg [6:0] min_sn; reg [6:0] hour_sn;

reg[6:0] _seg1; reg[6:0] _seg2; reg[6:0] _seg3;
reg[6:0] _seg4; reg[6:0] _seg5; reg[6:0] _seg6;

reg[6:0] _seg1_st; reg[6:0] _seg2_st; reg[6:0] _seg3_st;
reg[6:0] _seg4_st; reg[6:0] _seg5_st; reg[6:0] _seg6_st;

reg[1:0] st_mux_prev;

parameter mux_core = 2'b00; parameter mux_alarm = 2'b01;
parameter mux_stop = 2'b10;

parameter set_none = 2'b00; parameter set_ap = 2'b01;
parameter set_hour = 2'b10; parameter set_min = 2'b11;

parameter time_status = 3'd3;

reg[2:0]	st_status; // transient status which prints enterning mode
reg[5:0] st_blink; // st_blink[i] means blink (i+1)th order
reg[5:0] st_seg; // st_seg[i] means seg (i+1)th is on

segment_status st(st_mux, _seg1_st, _seg2_st, _seg3_st, _seg4_st, _seg5_st, _seg6_st);

always@(posedge clk_time) begin
if(st_status >= time_status) st_status=0;
else if(st_status != 0) st_status = st_status+1;

st_seg[0]=(st_blink[0])?~st_seg[0]:1;
st_seg[1]=(st_blink[1])?~st_seg[1]:1;
st_seg[2]=(st_blink[2])?~st_seg[2]:1;
st_seg[3]=(st_blink[3])?~st_seg[3]:1;
st_seg[4]=(st_blink[4])?~st_seg[4]:1;
st_seg[5]=(st_blink[5])?~st_seg[5]:1;
end

always@(posedge clk_tick) begin
if(rst) begin
alarmed = 0; st_status=0; st_blink=0;
end

if(snooze_set && (hour_now==hour_sn) && (min_now==min_sn) && (sec_now==0)) alarmed=1;

if(st_mux_prev!=st_mux) begin
st_mux_prev = st_mux;
st_status=1;
end

if(mode) begin case(st_mux)
mux_core: st_mux=mux_alarm;
mux_alarm: st_mux=mux_stop;
mux_stop: st_mux=mux_core;
endcase

end

case(st_mux)
mux_core: begin

if(st_status == 0) begin
_seg1=seg1_core; _seg2=seg2_core; _seg3=seg3_core;
_seg4=seg4_core; _seg5=seg5_core; _seg6=seg6_core;
end
else begin
_seg1=_seg1_st; _seg2=_seg2_st; _seg3=_seg3_st; 
_seg4=_seg4_st; _seg5=_seg5_st; _seg6=_seg6_st;
end

if(clear) alarmed=0;
else if(snooze && alarmed) begin
snooze_set=1; min_sn = min_now+5; hour_sn = hour_now; alarmed=0;
if(min_sn>=60) begin min_sn=min_sn-60; hour_sn = hour_sn + 1; end
if(hour_sn>=24) hour_sn=hour_sn-24;
end 

leds=0;

case(st_core[3:2])
	set_none: begin if(alarmed) st_blink=6'b111111; else st_blink=6'b000000; end
	set_ap: st_blink=6'b000001;
	set_hour: st_blink=(st_core[0])?6'b001100:6'b000011; // st_core[0]= (0with24) (1with12)
	set_min: st_blink=(st_core[0])?6'b110000:6'b001100; // st_core[0]= (0with24) (1with12)
endcase

end
mux_alarm: begin 
if(st_status == 0) begin
_seg1=seg1_alarm; _seg2=seg2_alarm; _seg3=seg3_alarm;
_seg4=seg4_alarm; _seg5=seg5_alarm; _seg6=seg6_alarm;
end
else begin
_seg1=_seg1_st; _seg2=_seg2_st; _seg3=_seg3_st; 
_seg4=_seg4_st; _seg5=_seg5_st; _seg6=_seg6_st;
end

leds=alarm_now;

case(st_alarm[2:1])
set_none: st_blink=6'b000000;
set_ap: st_blink=6'b000001;
set_hour: st_blink=(st_core[0])?6'b001100:6'b000011; // st_core[0]= (0with24) (1with12)
set_min: st_blink=(st_core[0])?6'b110000:6'b001100; // st_core[0]= (0with24) (1with12)
endcase

end
mux_stop: begin 
if(st_status == 0) begin
_seg1=seg1_stop; _seg2=seg2_stop; _seg3=seg3_stop;
_seg4=seg4_stop; _seg5=seg5_stop; _seg6=seg6_stop;
end
else begin
_seg1=_seg1_st; _seg2=_seg2_st; _seg3=_seg3_st; 
_seg4=_seg4_st; _seg5=_seg5_st; _seg6=_seg6_st;
end

leds=0;
st_blink=6'b000000;
end
endcase

if(alarmed_) alarmed=1;

seg1=(st_seg[0])?_seg1:0;
seg2=(st_seg[1])?_seg2:0;
seg3=(st_seg[2])?_seg3:0;
seg4=(st_seg[3])?_seg4:0;
seg5=(st_seg[4])?_seg5:0;
seg6=(st_seg[5])?_seg6:0;
end

endmodule
