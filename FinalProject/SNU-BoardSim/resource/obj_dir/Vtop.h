// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _Vtop_H_
#define _Vtop_H_

#include "verilated.h"

class Vtop__Syms;

//----------

VL_MODULE(Vtop) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    // Begin mtask footprint  all: 
    VL_IN8(clk,0,0);
    VL_IN8(push_switch1,0,0);
    VL_IN8(push_switch2,0,0);
    VL_IN8(push_switch3,0,0);
    VL_IN8(push_switch4,0,0);
    VL_IN8(push_switch5,0,0);
    VL_IN8(push_switch6,0,0);
    VL_OUT8(segment1,6,0);
    VL_OUT8(segment2,6,0);
    VL_OUT8(segment3,6,0);
    VL_OUT8(segment4,6,0);
    VL_OUT8(segment5,6,0);
    VL_OUT8(segment6,6,0);
    VL_IN8(dip_switch1,0,0);
    VL_IN8(dip_switch2,0,0);
    VL_IN8(dip_switch3,0,0);
    VL_IN8(dip_switch4,0,0);
    VL_IN8(dip_switch5,0,0);
    VL_IN8(dip_switch6,0,0);
    VL_IN8(dip_switch7,0,0);
    VL_IN8(dip_switch8,0,0);
    VL_IN8(dip_switch9,0,0);
    VL_IN8(dip_switch10,0,0);
    VL_OUT8(led1_red,0,0);
    VL_OUT8(led2_yellow,0,0);
    VL_OUT8(led3_green,0,0);
    VL_OUT8(led4_red,0,0);
    VL_OUT8(led5_yellow,0,0);
    VL_OUT8(led6_green,0,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    // Anonymous structures to workaround compiler member-count bugs
    struct {
	// Begin mtask footprint  all: 
	VL_SIG8(top__DOT__clk_100Hz,0,0);
	VL_SIG8(top__DOT__clk_1Hz,0,0);
	VL_SIG8(top__DOT__clk_2Hz,0,0);
	VL_SIG8(top__DOT__st_core,3,0);
	VL_SIG8(top__DOT__st_alarm,3,0);
	VL_SIG8(top__DOT__st_mux,1,0);
	VL_SIG8(top__DOT__seg1_core,6,0);
	VL_SIG8(top__DOT__seg2_core,6,0);
	VL_SIG8(top__DOT__seg3_core,6,0);
	VL_SIG8(top__DOT__seg4_core,6,0);
	VL_SIG8(top__DOT__seg5_core,6,0);
	VL_SIG8(top__DOT__seg6_core,6,0);
	VL_SIG8(top__DOT__seg1_alarm,6,0);
	VL_SIG8(top__DOT__seg2_alarm,6,0);
	VL_SIG8(top__DOT__seg3_alarm,6,0);
	VL_SIG8(top__DOT__seg4_alarm,6,0);
	VL_SIG8(top__DOT__seg5_alarm,6,0);
	VL_SIG8(top__DOT__seg6_alarm,6,0);
	VL_SIG8(top__DOT__seg1_stop,6,0);
	VL_SIG8(top__DOT__seg2_stop,6,0);
	VL_SIG8(top__DOT__seg3_stop,6,0);
	VL_SIG8(top__DOT__seg4_stop,6,0);
	VL_SIG8(top__DOT__seg5_stop,6,0);
	VL_SIG8(top__DOT__seg6_stop,6,0);
	VL_SIG8(top__DOT__alarmed,0,0);
	VL_SIG8(top__DOT__min_now,6,0);
	VL_SIG8(top__DOT__hour_now,6,0);
	VL_SIG8(top__DOT__sec_now,6,0);
	VL_SIG8(top__DOT__alarm_now,3,0);
	VL_SIG8(top__DOT__leds,3,0);
	VL_SIG8(top__DOT__leds_lap,1,0);
	VL_SIG8(top__DOT__P1__DOT__s,1,0);
	VL_SIG8(top__DOT__P1__DOT__s_nxt,1,0);
	VL_SIG8(top__DOT__P2__DOT__s,1,0);
	VL_SIG8(top__DOT__P2__DOT__s_nxt,1,0);
	VL_SIG8(top__DOT__P3__DOT__s,1,0);
	VL_SIG8(top__DOT__P3__DOT__s_nxt,1,0);
	VL_SIG8(top__DOT__P4__DOT__s,1,0);
	VL_SIG8(top__DOT__P4__DOT__s_nxt,1,0);
	VL_SIG8(top__DOT__P5__DOT__s,1,0);
	VL_SIG8(top__DOT__P5__DOT__s_nxt,1,0);
	VL_SIG8(top__DOT__M2__DOT__cnt,5,0);
	VL_SIG8(top__DOT__M3__DOT__cnt,5,0);
	VL_SIG8(top__DOT__C__DOT___seg1_12,6,0);
	VL_SIG8(top__DOT__C__DOT___seg4_12,6,0);
	VL_SIG8(top__DOT__C__DOT___seg6_12,6,0);
	VL_SIG8(top__DOT__C__DOT___seg2_24,6,0);
	VL_SIG8(top__DOT__C__DOT___seg4_24,6,0);
	VL_SIG8(top__DOT__C__DOT___seg6_24,6,0);
	VL_SIG8(top__DOT__C__DOT___hour_12,6,0);
	VL_SIG8(top__DOT__C__DOT__D1_12__DOT___seg1,6,0);
	VL_SIG8(top__DOT__C__DOT__D1_12__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__C__DOT__D1_12__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__C__DOT__D1_12__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__C__DOT__D1_12__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__C__DOT__D2_12__DOT___seg1,6,0);
	VL_SIG8(top__DOT__C__DOT__D1_24__DOT___seg1,6,0);
	VL_SIG8(top__DOT__C__DOT__D1_24__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__C__DOT__D1_24__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__C__DOT__D1_24__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__C__DOT__D1_24__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__C__DOT__D2_24__DOT___seg1,6,0);
	VL_SIG8(top__DOT__C__DOT__D2_24__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__C__DOT__D2_24__DOT__U1__DOT__c2,3,0);
    };
    struct {
	VL_SIG8(top__DOT__C__DOT__D2_24__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__C__DOT__D2_24__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__C__DOT__D3_24__DOT___seg1,6,0);
	VL_SIG8(top__DOT__C__DOT__D3_24__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__C__DOT__D3_24__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__C__DOT__D3_24__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__C__DOT__D3_24__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__S__DOT__st,0,0);
	VL_SIG8(top__DOT__S__DOT__disp_cur,1,0);
	VL_SIG8(top__DOT__S__DOT__leds_lap_,1,0);
	VL_SIG8(top__DOT__S__DOT__lap_cur,0,0);
	VL_SIG8(top__DOT__S__DOT__blink,0,0);
	VL_SIG8(top__DOT__S__DOT__dsec,6,0);
	VL_SIG8(top__DOT__S__DOT__sec,6,0);
	VL_SIG8(top__DOT__S__DOT__min,6,0);
	VL_SIG8(top__DOT__S__DOT__dsec_l1,6,0);
	VL_SIG8(top__DOT__S__DOT__sec_l1,6,0);
	VL_SIG8(top__DOT__S__DOT__min_l1,6,0);
	VL_SIG8(top__DOT__S__DOT__dsec_l2,6,0);
	VL_SIG8(top__DOT__S__DOT__sec_l2,6,0);
	VL_SIG8(top__DOT__S__DOT__min_l2,6,0);
	VL_SIG8(top__DOT__S__DOT___seg2,6,0);
	VL_SIG8(top__DOT__S__DOT___seg4,6,0);
	VL_SIG8(top__DOT__S__DOT___seg6,6,0);
	VL_SIG8(top__DOT__S__DOT___seg1_l1,6,0);
	VL_SIG8(top__DOT__S__DOT___seg2_l1,6,0);
	VL_SIG8(top__DOT__S__DOT___seg4_l1,6,0);
	VL_SIG8(top__DOT__S__DOT___seg6_l1,6,0);
	VL_SIG8(top__DOT__S__DOT___seg2_l2,6,0);
	VL_SIG8(top__DOT__S__DOT___seg4_l2,6,0);
	VL_SIG8(top__DOT__S__DOT___seg6_l2,6,0);
	VL_SIG8(top__DOT__S__DOT__D1__DOT__order1,3,0);
	VL_SIG8(top__DOT__S__DOT__D1__DOT___seg1,6,0);
	VL_SIG8(top__DOT__S__DOT__D1__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__S__DOT__D1__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__S__DOT__D1__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__S__DOT__D1__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__S__DOT__D2__DOT__order1,3,0);
	VL_SIG8(top__DOT__S__DOT__D2__DOT___seg1,6,0);
	VL_SIG8(top__DOT__S__DOT__D2__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__S__DOT__D2__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__S__DOT__D2__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__S__DOT__D2__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__S__DOT__D3__DOT___seg1,6,0);
	VL_SIG8(top__DOT__S__DOT__D3__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__S__DOT__D3__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__S__DOT__D3__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__S__DOT__D3__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__S__DOT__D4__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__S__DOT__D4__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__S__DOT__D4__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__S__DOT__D4__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__S__DOT__D5__DOT__order1,3,0);
	VL_SIG8(top__DOT__S__DOT__D5__DOT___seg1,6,0);
	VL_SIG8(top__DOT__S__DOT__D5__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__S__DOT__D5__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__S__DOT__D5__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__S__DOT__D5__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__S__DOT__D6__DOT___seg1,6,0);
	VL_SIG8(top__DOT__S__DOT__D6__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__S__DOT__D6__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__S__DOT__D6__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__S__DOT__D6__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__S__DOT__D7__DOT__order1,3,0);
    };
    struct {
	VL_SIG8(top__DOT__S__DOT__D7__DOT___seg1,6,0);
	VL_SIG8(top__DOT__S__DOT__D7__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__S__DOT__D7__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__S__DOT__D7__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__S__DOT__D7__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__S__DOT__D8__DOT__order1,3,0);
	VL_SIG8(top__DOT__S__DOT__D8__DOT___seg1,6,0);
	VL_SIG8(top__DOT__S__DOT__D8__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__S__DOT__D8__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__S__DOT__D8__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__S__DOT__D8__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__S__DOT__D9__DOT___seg1,6,0);
	VL_SIG8(top__DOT__S__DOT__D9__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__S__DOT__D9__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__S__DOT__D9__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__S__DOT__D9__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__A__DOT__disp_null,0,0);
	VL_SIG8(top__DOT__A__DOT__hour1,6,0);
	VL_SIG8(top__DOT__A__DOT__min1,6,0);
	VL_SIG8(top__DOT__A__DOT__hour6,6,0);
	VL_SIG8(top__DOT__A__DOT__min6,6,0);
	VL_SIG8(top__DOT__A__DOT__hour2,6,0);
	VL_SIG8(top__DOT__A__DOT__min2,6,0);
	VL_SIG8(top__DOT__A__DOT__hour7,6,0);
	VL_SIG8(top__DOT__A__DOT__min7,6,0);
	VL_SIG8(top__DOT__A__DOT__hour3,6,0);
	VL_SIG8(top__DOT__A__DOT__min3,6,0);
	VL_SIG8(top__DOT__A__DOT__hour8,6,0);
	VL_SIG8(top__DOT__A__DOT__min8,6,0);
	VL_SIG8(top__DOT__A__DOT__hour4,6,0);
	VL_SIG8(top__DOT__A__DOT__min4,6,0);
	VL_SIG8(top__DOT__A__DOT__hour9,6,0);
	VL_SIG8(top__DOT__A__DOT__min9,6,0);
	VL_SIG8(top__DOT__A__DOT__hour5,6,0);
	VL_SIG8(top__DOT__A__DOT__min5,6,0);
	VL_SIG8(top__DOT__A__DOT__hour10,6,0);
	VL_SIG8(top__DOT__A__DOT__min10,6,0);
	VL_SIG8(top__DOT__A__DOT___seg2_24,6,0);
	VL_SIG8(top__DOT__A__DOT___seg4_24,6,0);
	VL_SIG8(top__DOT__A__DOT___seg1_12,6,0);
	VL_SIG8(top__DOT__A__DOT___seg4_12,6,0);
	VL_SIG8(top__DOT__A__DOT___seg6_12,6,0);
	VL_SIG8(top__DOT__A__DOT___hour,6,0);
	VL_SIG8(top__DOT__A__DOT___min,6,0);
	VL_SIG8(top__DOT__A__DOT__alarm_next,3,0);
	VL_SIG8(top__DOT__A__DOT__D1_12__DOT___seg1,6,0);
	VL_SIG8(top__DOT__A__DOT__D1_12__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__A__DOT__D1_12__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__A__DOT__D1_12__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__A__DOT__D1_12__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__A__DOT__D2_12__DOT___seg1,6,0);
	VL_SIG8(top__DOT__A__DOT__D2_12__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__A__DOT__D2_12__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__A__DOT__D2_12__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__A__DOT__D2_12__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__A__DOT__D1_24__DOT___seg1,6,0);
	VL_SIG8(top__DOT__A__DOT__D1_24__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__A__DOT__D1_24__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__A__DOT__D1_24__DOT__U1__DOT__c3,3,0);
	VL_SIG8(top__DOT__A__DOT__D1_24__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__A__DOT__D2_24__DOT___seg1,6,0);
	VL_SIG8(top__DOT__A__DOT__D2_24__DOT__U1__DOT__c1,3,0);
	VL_SIG8(top__DOT__A__DOT__D2_24__DOT__U1__DOT__c2,3,0);
	VL_SIG8(top__DOT__A__DOT__D2_24__DOT__U1__DOT__c3,3,0);
    };
    struct {
	VL_SIG8(top__DOT__A__DOT__D2_24__DOT__U1__DOT__c4,3,0);
	VL_SIG8(top__DOT__D__DOT__alarmed,0,0);
	VL_SIG8(top__DOT__D__DOT__snooze_set,0,0);
	VL_SIG8(top__DOT__D__DOT__min_sn,6,0);
	VL_SIG8(top__DOT__D__DOT__hour_sn,6,0);
	VL_SIG8(top__DOT__D__DOT___seg1,6,0);
	VL_SIG8(top__DOT__D__DOT___seg2,6,0);
	VL_SIG8(top__DOT__D__DOT___seg3,6,0);
	VL_SIG8(top__DOT__D__DOT___seg4,6,0);
	VL_SIG8(top__DOT__D__DOT___seg5,6,0);
	VL_SIG8(top__DOT__D__DOT___seg6,6,0);
	VL_SIG8(top__DOT__D__DOT___seg1_st,6,0);
	VL_SIG8(top__DOT__D__DOT___seg2_st,6,0);
	VL_SIG8(top__DOT__D__DOT___seg3_st,6,0);
	VL_SIG8(top__DOT__D__DOT___seg4_st,6,0);
	VL_SIG8(top__DOT__D__DOT___seg5_st,6,0);
	VL_SIG8(top__DOT__D__DOT___seg6_st,6,0);
	VL_SIG8(top__DOT__D__DOT__st_mux_prev,1,0);
	VL_SIG8(top__DOT__D__DOT__st_status,2,0);
	VL_SIG8(top__DOT__D__DOT__st_blink,5,0);
	VL_SIG8(top__DOT__D__DOT__st_seg,5,0);
	VL_SIG16(top__DOT__alarm_act,9,0);
	VL_SIG16(top__DOT__M1__DOT__cnt,13,0);
	VL_SIG16(top__DOT__A__DOT__alarm_set,9,0);
    };
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    // Begin mtask footprint  all: 
    VL_SIG8(__Vtableidx1,2,0);
    VL_SIG8(__Vtableidx2,2,0);
    VL_SIG8(__Vtableidx3,2,0);
    VL_SIG8(__Vtableidx4,2,0);
    VL_SIG8(__Vtableidx5,2,0);
    VL_SIG8(__Vtableidx6,3,0);
    VL_SIG8(__Vtableidx7,3,0);
    VL_SIG8(__Vtableidx8,3,0);
    VL_SIG8(__Vtableidx9,3,0);
    VL_SIG8(__Vtableidx10,3,0);
    VL_SIG8(__Vtableidx11,3,0);
    VL_SIG8(__Vtableidx12,3,0);
    VL_SIG8(__Vtableidx13,3,0);
    VL_SIG8(__Vtableidx14,3,0);
    VL_SIG8(__Vtableidx15,3,0);
    VL_SIG8(__Vtableidx16,3,0);
    VL_SIG8(__Vtableidx17,3,0);
    VL_SIG8(__Vtableidx18,3,0);
    VL_SIG8(__Vtableidx19,3,0);
    VL_SIG8(__Vtableidx20,3,0);
    VL_SIG8(__Vtableidx21,3,0);
    VL_SIG8(__Vtableidx22,3,0);
    VL_SIG8(__Vtableidx24,3,0);
    VL_SIG8(__Vtableidx25,3,0);
    VL_SIG8(__Vtableidx26,3,0);
    VL_SIG8(__Vtableidx27,3,0);
    VL_SIG8(__Vtableidx28,3,0);
    VL_SIG8(__Vtableidx29,3,0);
    VL_SIG8(__Vtableidx30,3,0);
    VL_SIG8(__Vtableidx31,3,0);
    VL_SIG8(__Vtableidx32,3,0);
    VL_SIG8(__Vtableidx33,3,0);
    VL_SIG8(__Vtableidx34,3,0);
    VL_SIG8(__Vtableidx35,3,0);
    VL_SIG8(__Vtableidx36,3,0);
    VL_SIG8(__Vtableidx37,3,0);
    VL_SIG8(__Vtableidx38,3,0);
    VL_SIG8(__Vtableidx39,3,0);
    VL_SIG8(__Vtableidx40,3,0);
    VL_SIG8(__Vtableidx41,3,0);
    VL_SIG8(__Vtableidx43,1,0);
    VL_SIG8(__Vclklast__TOP__clk,0,0);
    VL_SIG8(__Vclklast__TOP__top__DOT__clk_100Hz,0,0);
    VL_SIG8(__Vclklast__TOP__top__DOT__clk_2Hz,0,0);
    VL_SIG8(__Vclklast__TOP__top__DOT__clk_1Hz,0,0);
    VL_SIG16(__Vtableidx42,13,0);
    VL_SIG8(__Vtablechg1[8],0,0);
    VL_SIG8(__Vtablechg2[8],0,0);
    VL_SIG8(__Vtablechg3[8],0,0);
    VL_SIG8(__Vtablechg4[8],0,0);
    VL_SIG8(__Vtablechg5[8],0,0);
    VL_SIG8(__Vtablechg42[16384],0,0);
    VL_SIG8(__Vtablechg43[4],5,0);
    static VL_ST_SIG8(__Vtable1_top__DOT__P1__DOT__s_nxt[8],1,0);
    static VL_ST_SIG8(__Vtable2_top__DOT__P2__DOT__s_nxt[8],1,0);
    static VL_ST_SIG8(__Vtable3_top__DOT__P3__DOT__s_nxt[8],1,0);
    static VL_ST_SIG8(__Vtable4_top__DOT__P4__DOT__s_nxt[8],1,0);
    static VL_ST_SIG8(__Vtable5_top__DOT__P5__DOT__s_nxt[8],1,0);
    static VL_ST_SIG8(__Vtable6_top__DOT__C__DOT___seg4_12[16],6,0);
    static VL_ST_SIG8(__Vtable7_top__DOT__C__DOT__D1_12__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable8_top__DOT__C__DOT___seg6_12[16],6,0);
    static VL_ST_SIG8(__Vtable9_top__DOT__C__DOT__D2_12__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable10_top__DOT__C__DOT___seg2_24[16],6,0);
    static VL_ST_SIG8(__Vtable11_top__DOT__C__DOT__D1_24__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable12_top__DOT__C__DOT___seg4_24[16],6,0);
    static VL_ST_SIG8(__Vtable13_top__DOT__C__DOT__D2_24__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable14_top__DOT__C__DOT___seg6_24[16],6,0);
    static VL_ST_SIG8(__Vtable15_top__DOT__C__DOT__D3_24__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable16_top__DOT__S__DOT___seg2[16],6,0);
    static VL_ST_SIG8(__Vtable17_top__DOT__S__DOT__D1__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable18_top__DOT__S__DOT___seg4[16],6,0);
    static VL_ST_SIG8(__Vtable19_top__DOT__S__DOT__D2__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable20_top__DOT__S__DOT___seg6[16],6,0);
    static VL_ST_SIG8(__Vtable21_top__DOT__S__DOT__D3__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable22_top__DOT__S__DOT___seg2_l1[16],6,0);
    static VL_ST_SIG8(__Vtable24_top__DOT__S__DOT___seg4_l1[16],6,0);
    static VL_ST_SIG8(__Vtable25_top__DOT__S__DOT__D5__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable26_top__DOT__S__DOT___seg6_l1[16],6,0);
    static VL_ST_SIG8(__Vtable27_top__DOT__S__DOT__D6__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable28_top__DOT__S__DOT___seg2_l2[16],6,0);
    static VL_ST_SIG8(__Vtable29_top__DOT__S__DOT__D7__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable30_top__DOT__S__DOT___seg4_l2[16],6,0);
    static VL_ST_SIG8(__Vtable31_top__DOT__S__DOT__D8__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable32_top__DOT__S__DOT___seg6_l2[16],6,0);
    static VL_ST_SIG8(__Vtable33_top__DOT__S__DOT__D9__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable34_top__DOT__A__DOT___seg4_12[16],6,0);
    static VL_ST_SIG8(__Vtable35_top__DOT__A__DOT__D1_12__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable36_top__DOT__A__DOT___seg6_12[16],6,0);
    static VL_ST_SIG8(__Vtable37_top__DOT__A__DOT__D2_12__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable38_top__DOT__A__DOT___seg2_24[16],6,0);
    static VL_ST_SIG8(__Vtable39_top__DOT__A__DOT__D1_24__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable40_top__DOT__A__DOT___seg4_24[16],6,0);
    static VL_ST_SIG8(__Vtable41_top__DOT__A__DOT__D2_24__DOT___seg1[16],6,0);
    static VL_ST_SIG8(__Vtable42_top__DOT__A__DOT__alarm_next[16384],3,0);
    static VL_ST_SIG8(__Vtable43_top__DOT__D__DOT___seg1_st[4],6,0);
    static VL_ST_SIG8(__Vtable43_top__DOT__D__DOT___seg2_st[4],6,0);
    static VL_ST_SIG8(__Vtable43_top__DOT__D__DOT___seg3_st[4],6,0);
    static VL_ST_SIG8(__Vtable43_top__DOT__D__DOT___seg4_st[4],6,0);
    static VL_ST_SIG8(__Vtable43_top__DOT__D__DOT___seg5_st[4],6,0);
    static VL_ST_SIG8(__Vtable43_top__DOT__D__DOT___seg6_st[4],6,0);
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vtop__Syms* __VlSymsp;  // Symbol table
    
    // PARAMETERS
    // Parameters marked /*verilator public*/ for use by application code
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vtop);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    Vtop(const char* name="TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vtop();
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vtop__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vtop__Syms* symsp, bool first);
  private:
    static QData _change_request(Vtop__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__4(Vtop__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset();
  public:
    static void _eval(Vtop__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif // VL_DEBUG
  public:
    static void _eval_initial(Vtop__Syms* __restrict vlSymsp);
    static void _eval_settle(Vtop__Syms* __restrict vlSymsp);
    static void _initial__TOP__2(Vtop__Syms* __restrict vlSymsp);
    static void _multiclk__TOP__7(Vtop__Syms* __restrict vlSymsp);
    static void _multiclk__TOP__9(Vtop__Syms* __restrict vlSymsp);
    static void _sequent__TOP__1(Vtop__Syms* __restrict vlSymsp);
    static void _sequent__TOP__5(Vtop__Syms* __restrict vlSymsp);
    static void _sequent__TOP__6(Vtop__Syms* __restrict vlSymsp);
    static void _sequent__TOP__8(Vtop__Syms* __restrict vlSymsp);
    static void _settle__TOP__3(Vtop__Syms* __restrict vlSymsp);
} VL_ATTR_ALIGNED(128);

#endif // guard
