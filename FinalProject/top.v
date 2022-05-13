module top(
    input clk,
    input push_switch1,
    input push_switch2,
    input push_switch3,
    input push_switch4,
    input push_switch5,
    input push_switch6,

    output [6:0] segment1,
    output [6:0] segment2,
    output [6:0] segment3,
    output [6:0] segment4,
    output [6:0] segment5,
    output [6:0] segment6,
    
    input dip_switch1,
    input dip_switch2,
    input dip_switch3,
    input dip_switch4,
    input dip_switch5,
    input dip_switch6,
    input dip_switch7,
    input dip_switch8,
    input dip_switch9,
    input dip_switch10,

    output led1_red,
    output led2_yellow,	
    output led3_green,
    output led4_red,
    output led5_yellow,
    output led6_green
);

wire clk_100Hz; wire clk_1Hz; wire clk_2Hz;
wire mode; wire set; wire disp_up_clear; wire aoff_down; wire next;
wire[3:0] st_core; wire[3:0] st_alarm; wire[1:0] st_mux;
wire[6:0] seg1_core; wire[6:0] seg2_core; wire[6:0] seg3_core;
wire[6:0] seg4_core; wire[6:0] seg5_core; wire[6:0] seg6_core;
wire[6:0] seg1_alarm; wire[6:0] seg2_alarm; wire[6:0] seg3_alarm;
wire[6:0] seg4_alarm; wire[6:0] seg5_alarm; wire[6:0] seg6_alarm;
wire[6:0] seg1_stop; wire[6:0] seg2_stop; wire[6:0] seg3_stop;
wire[6:0] seg4_stop; wire[6:0] seg5_stop; wire[6:0] seg6_stop;

wire alarmed;
wire[6:0] min_now; wire[6:0] hour_now; wire[6:0] sec_now;
wire[6:0] min_alarm; wire[6:0] hour_alarm;

wire[9:0] alarm_act; wire[3:0] alarm_now; wire[3:0] leds;

wire[1:0] leds_lap;

assign alarm_act={
	dip_switch10,dip_switch9,dip_switch8,
	dip_switch7,dip_switch6,dip_switch5,
	dip_switch4,dip_switch3,dip_switch2,dip_switch1
};
assign {led3_green,led4_red,led5_yellow,led6_green}=leds;
assign {led1_red, led2_yellow} = leds_lap;

pulse_generator 			P1(.clk(clk), .in(push_switch1), .rst(push_switch6), .out(mode));
pulse_generator 			P2(.clk(clk), .in(push_switch2), .rst(push_switch6), .out(set));
pulse_generator 			P3(.clk(clk), .in(push_switch3), .rst(push_switch6), .out(disp_up_clear));
pulse_generator 			P4(.clk(clk), .in(push_switch4), .rst(push_switch6), .out(aoff_down));
pulse_generator 			P5(.clk(clk), .in(push_switch5), .rst(push_switch6), .out(next));

clock_modulator_20000 	M1(.clk_in(clk), .clk_out(clk_100Hz));
clock_modulator_100 		M2(.clk_in(clk_100Hz), .clk_out(clk_1Hz));
clock_modulator_50 		M3(.clk_in(clk_100Hz), .clk_out(clk_2Hz));

clock_core 					C(.clk_time(clk_1Hz), .clk_tick(clk), .rst(push_switch6),
			.mode(mode), .set(set), .disp_up(disp_up_clear), .down(aoff_down), 
			.st_mux(st_mux), .st(st_core), .min(min_now), .hour(hour_now), .sec(sec_now),
			.seg1(seg1_core), .seg2(seg2_core), .seg3(seg3_core),
			.seg4(seg4_core), .seg5(seg5_core), .seg6(seg6_core)
			);
			
clock_stop					S(.clk_time(clk_100Hz), .clk_tick(clk), .rst(push_switch6),
			.mode(mode), .set(set), .clear(disp_up_clear), .st_mux(st_mux),
			.lap(aoff_down), .next(next), .leds_lap(leds_lap), .clk_1Hz(clk_2Hz),
			.seg1(seg1_stop), .seg2(seg2_stop), .seg3(seg3_stop),
			.seg4(seg4_stop), .seg5(seg5_stop), .seg6(seg6_stop)
			);

clock_alarm					A(.clk_time(clk_1Hz), .clk_tick(clk), .rst(push_switch6),
			.mode(mode), .set(set), .disp_up(disp_up_clear), .down_clear(aoff_down),
			.next(next), .st_mux(st_mux), .st(st_alarm), .alarm_act(alarm_act),
			.sec_now(sec_now), .min_now(min_now), .hour_now(hour_now), .alarmed(alarmed),
			.seg1(seg1_alarm), .seg2(seg2_alarm), .seg3(seg3_alarm),
			.seg4(seg4_alarm), .seg5(seg5_alarm), .seg6(seg6_alarm),
			.alarm_now(alarm_now)
			);

display_driver				D(.clk_time(clk_2Hz), .clk_tick(clk), .rst(push_switch6),
			.mode(mode), .st_core(st_core), .st_alarm(st_alarm), .alarm_now(alarm_now),
			.seg1_core(seg1_core), .seg2_core(seg2_core), .seg3_core(seg3_core), 
			.seg4_core(seg4_core), .seg5_core(seg5_core), .seg6_core(seg6_core), 
			.seg1_alarm(seg1_alarm), .seg2_alarm(seg2_alarm), .seg3_alarm(seg3_alarm), 
			.seg4_alarm(seg4_alarm), .seg5_alarm(seg5_alarm), .seg6_alarm(seg6_alarm), 
			.seg1_stop(seg1_stop), .seg2_stop(seg2_stop), .seg3_stop(seg3_stop), 
			.seg4_stop(seg4_stop), .seg5_stop(seg5_stop), .seg6_stop(seg6_stop), 
			.seg1(segment1), .seg2(segment2), .seg3(segment3), .seg4(segment4), 
			.seg5(segment5), .seg6(segment6), .snooze(next),
			.sec_now(sec_now), .min_now(min_now), .hour_now(hour_now),
			.st_mux(st_mux), .leds(leds), .alarmed_(alarmed), .clear(aoff_down)
			);

endmodule
