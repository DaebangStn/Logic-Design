module segment_status(
	 input[1:0] st_mux,
    output reg[6:0] seg1,
    output reg[6:0] seg2,
    output reg[6:0] seg3,
    output reg[6:0] seg4,
    output reg[6:0] seg5,
    output reg[6:0] seg6
    );

parameter mux_core = 2'b00; parameter mux_alarm = 2'b01;
parameter mux_stop = 2'b10;

parameter s_ = 7'b1011011; parameter t_ = 7'b0001111;
parameter o_ = 7'b1111110; parameter p_ = 7'b1100111;
parameter d_ = 7'b0111101; parameter a_ = 7'b1110111;
parameter l_ = 7'b0001110; parameter r_ = 7'b0000101;
parameter c_ = 7'b1001110; parameter k_ = 7'b1010111;
parameter m_ = 7'b1010101;

always@(*) begin
case(st_mux)
mux_stop: begin seg1=s_; seg2=t_; seg3=o_; seg4=p_; seg5=p_; seg6=d_; end
mux_alarm: begin seg1=a_; seg2=l_; seg3=a_; seg4=r_; seg5=m_; seg6=0; end
mux_core: begin seg1=c_; seg2=l_; seg3=o_; seg4=c_; seg5=k_; seg6=0; end
endcase
end

endmodule
