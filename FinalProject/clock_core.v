`timescale 1ns / 1ps

module clock_core(
    input clk_time,
    input clk_tick,
	 input rst,
	 input mode,
	 input set,
	 input disp_up,
	 input down,
	 input [1:0] st_mux,
	 output reg[6:0] seg1,
	 output reg[6:0] seg2,
	 output reg[6:0] seg3,
	 output reg[6:0] seg4,
	 output reg[6:0] seg5,
	 output reg[6:0] seg6,
	 output reg[3:0] st,
	 output reg[6:0] sec,
	 output reg[6:0] min,
	 output reg[6:0] hour
    );


wire[6:0] _seg1_12; wire[6:0] _seg2_12; wire[6:0] _seg3_12;
wire[6:0] _seg4_12; wire[6:0] _seg5_12; wire[6:0] _seg6_12;
wire[6:0] _seg1_24; wire[6:0] _seg2_24; wire[6:0] _seg3_24;
wire[6:0] _seg4_24; wire[6:0] _seg5_24; wire[6:0] _seg6_24;


wire[6:0] _hour_12;
assign _hour_12=(hour>12)?(hour-12):hour;

// cont/halt: bit1, 24/12: bit0
parameter mux_core = 2'b00;
parameter cont_24 = 2'b00; parameter cont_12 = 2'b01;
parameter halt_24 = 2'b10; parameter halt_12 = 2'b11;
parameter set_none = 2'b00; parameter set_ap = 2'b01;
parameter set_hour = 2'b10; parameter set_min = 2'b11;

initial begin sec=0; min=0; hour=0; st={set_none, cont_24}; end

parameter seg_A = 7'b1110111; parameter seg_P = 7'b1100111;

assign _seg1_12 = (hour>12)?seg_P:seg_A;
assign _seg2_12=0;
segment_decoder_2 D1_12(_hour_12, 1, _seg3_12, _seg4_12);
segment_decoder_2 D2_12(min, 1, _seg5_12, _seg6_12);

segment_decoder_2 D1_24(hour, 1, _seg1_24, _seg2_24);
segment_decoder_2 D2_24(min, 1, _seg3_24, _seg4_24);
segment_decoder_2 D3_24(sec, 1, _seg5_24, _seg6_24);

always@(negedge clk_time) begin
if((~rst)&&(st[1]==0)) begin
	if(sec==7'd59) begin sec=0; min=min+1; end
	else 	sec=sec+1;
	if(min==7'd60) begin min=0; hour=hour+1; end
	if(hour==7'd24) hour=0;
end

end

always@(posedge clk_tick) begin
if(rst) begin
sec = 0; min = 0; hour = 0;
st={set_none, cont_24};
end
else if(mode) begin
st={set_none, 0, st[0]};
end
else if((st_mux==mux_core)&&set) begin
	if(st[1]==0) begin // cont->halt
	st[3:2]=(st[0])?set_ap:set_hour;
	sec=0; st[1]=1;
	end
	else case(st[3:2]) // state halt
	set_none: begin // error
	sec = 23; min = 10; hour = 0;
	st={set_none, cont_24};
	end
	set_ap: st[3:2]=set_hour;
	set_hour: st[3:2]=set_min;
	set_min: begin
	st[3:2]=set_none; st[1]=0;
	end
	endcase
end
else if((st_mux==mux_core)&&disp_up) begin case(st[3:2])
	set_none: st[0]=~st[0]; // state cont
	set_ap: hour=(hour>12)?hour-12:hour+12;
	set_hour: hour=(hour==23)?0:hour+1;
	set_min: min=(min==59)?0:min+1;
	endcase
end
else if((st_mux==mux_core)&&down) begin case(st[3:2])
	set_ap: hour=(hour>12)?hour-12:hour+12;
	set_hour: hour=(hour==0)?23:hour-1;
	set_min: min=(min==0)?59:min-1;
	endcase
end


seg1=(st[0])?_seg1_12:_seg1_24;
seg2=(st[0])?_seg2_12:_seg2_24;
seg3=(st[0])?_seg3_12:_seg3_24;
seg4=(st[0])?_seg4_12:_seg4_24;
seg5=(st[0])?_seg5_12:_seg5_24;
seg6=(st[0])?_seg6_12:_seg6_24;

end
endmodule
