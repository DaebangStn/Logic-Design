`timescale 1ns / 1ps

module clock_stop(
    input clk_time,
    input clk_tick,
	 input clk_1Hz,
	 input rst,
	 input mode,
	 input lap,
	 input next,
	 input set,
	 input clear,
	 input [1:0] st_mux,
	 output reg[1:0] leds_lap,
	 output reg[6:0] seg1,
	 output reg[6:0] seg2,
	 output reg[6:0] seg3,
	 output reg[6:0] seg4,
	 output reg[6:0] seg5,
	 output reg[6:0] seg6,
	 output reg st // 0 to stop, 1 to cont
    );

parameter disp_lap1=2'b01; parameter disp_lap2=2'b10;
parameter disp_stop=2'b00;

reg[1:0] disp_cur; reg[1:0] leds_lap_;
reg lap_cur; reg blink;

reg[6:0] dsec; reg[6:0] sec; reg[6:0] min;
reg[6:0] dsec_l1; reg[6:0] sec_l1; reg[6:0] min_l1;
reg[6:0] dsec_l2; reg[6:0] sec_l2; reg[6:0] min_l2;

reg[6:0] _seg1; reg[6:0] _seg2; reg[6:0] _seg3;
reg[6:0] _seg4; reg[6:0] _seg5; reg[6:0] _seg6;
reg[6:0] _seg1_l1; reg[6:0] _seg2_l1; reg[6:0] _seg3_l1;
reg[6:0] _seg4_l1; reg[6:0] _seg5_l1; reg[6:0] _seg6_l1;
reg[6:0] _seg1_l2; reg[6:0] _seg2_l2; reg[6:0] _seg3_l2;
reg[6:0] _seg4_l2; reg[6:0] _seg5_l2; reg[6:0] _seg6_l2;


parameter mux_stop = 2'b10;

segment_decoder_2 D1(min, 0, _seg1, _seg2);
segment_decoder_2 D2(sec, 0, _seg3, _seg4);
segment_decoder_2 D3(dsec, 1, _seg5, _seg6);

segment_decoder_2 D4(min_l1, 0, _seg1_1l, _seg2_l1);
segment_decoder_2 D5(sec_l1, 0, _seg3_l1, _seg4_l1);
segment_decoder_2 D6(dsec_l1, 1, _seg5_l1, _seg6_l1);

segment_decoder_2 D7(min_l2, 0, _seg1_l2, _seg2_l2);
segment_decoder_2 D8(sec_l2, 0, _seg3_l2, _seg4_l2);
segment_decoder_2 D9(dsec_l2, 1, _seg5_l2, _seg6_l2);


always@(posedge clk_time) begin
if((~rst)&&(st)) begin
	if(dsec==7'd99) begin dsec=0; sec=sec+1; end
	else dsec=dsec+1;
	if(sec==7'd60) begin sec=0; min=min+1; end
	if(min==7'd60) min=0;
end 
end

always@(posedge clk_1Hz) begin
case(disp_cur)
disp_stop: leds_lap=leds_lap_;
disp_lap1: begin leds_lap[0]=(blink)?leds_lap_[0]:0; leds_lap[1]=leds_lap_[1]; end
disp_lap2: begin leds_lap[1]=(blink)?leds_lap_[1]:0; leds_lap[0]=leds_lap_[0]; end
endcase

blink=~blink;
end


always@(posedge clk_tick) begin
if(rst) begin
dsec_l1=0; sec_l1=0; min_l1=0; dsec_l2=0; sec_l2=0; min_l2=0; 
dsec=0; sec=0; min=0; st=0; disp_cur=0; lap_cur=0; leds_lap_=0;
blink=0;
end
else if(st_mux==mux_stop) begin
	if(clear&&~st) begin 
	dsec_l1=0; sec_l1=0; min_l1=0; dsec_l2=0; sec_l2=0; min_l2=0; 
	leds_lap_=0; lap_cur=0; dsec=0; sec=0; min=0; 
	end
	else if(set) st=~st;
	else if(lap) begin
		if(lap_cur) begin
		dsec_l2 = dsec; sec_l2 = sec; min_l2 = min;
		leds_lap_[1]=1; lap_cur=~lap_cur;
		end
		else begin
		dsec_l1 = dsec; sec_l1 = sec; min_l1 = min;
		leds_lap_[0]=1; lap_cur=~lap_cur;
		end
	end
	else if(next) disp_cur = (disp_cur==disp_lap2)?disp_stop:(disp_cur+1);
end

case(disp_cur)
disp_stop: begin 
seg1 = _seg1; seg2 = _seg2; seg3 = _seg3; 
seg4 = _seg4; seg5 = _seg5; seg6 = _seg6;
end
disp_lap1: begin
seg1 = _seg1_l1; seg2 = _seg2_l1; seg3 = _seg3_l1; 
seg4 = _seg4_l1; seg5 = _seg5_l1; seg6 = _seg6_l1;
end
disp_lap2: begin
seg1 = _seg1_l2; seg2 = _seg2_l2; seg3 = _seg3_l2; 
seg4 = _seg4_l2; seg5 = _seg5_l2; seg6 = _seg6_l2;
end
endcase

end

endmodule
