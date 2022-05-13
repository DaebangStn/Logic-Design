// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "Vtop.h"              // For This
#include "Vtop__Syms.h"


//--------------------
// STATIC VARIABLES

// Begin mtask footprint  all: 
VL_ST_SIG8(Vtop::__Vtable1_top__DOT__U1__DOT__next_state[8],1,0);
VL_ST_SIG8(Vtop::__Vtable2_segment6[16],6,0);

//--------------------

VL_CTOR_IMP(Vtop) {
    Vtop__Syms* __restrict vlSymsp = __VlSymsp = new Vtop__Syms(this, name());
    Vtop* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vtop::__Vconfigure(Vtop__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Vtop::~Vtop() {
    delete __VlSymsp; __VlSymsp=NULL;
}

//--------------------


void Vtop::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vtop::eval\n"); );
    Vtop__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vtop* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
	VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
	_eval(vlSymsp);
	if (VL_UNLIKELY(++__VclockLoop > 100)) {
	    // About to fail, so enable debug to see what's not settling.
	    // Note you must run make with OPT=-DVL_DEBUG for debug prints.
	    int __Vsaved_debug = Verilated::debug();
	    Verilated::debug(1);
	    __Vchange = _change_request(vlSymsp);
	    Verilated::debug(__Vsaved_debug);
	    VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Verilated model didn't converge");
	} else {
	    __Vchange = _change_request(vlSymsp);
	}
    } while (VL_UNLIKELY(__Vchange));
}

void Vtop::_eval_initial_loop(Vtop__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
	_eval_settle(vlSymsp);
	_eval(vlSymsp);
	if (VL_UNLIKELY(++__VclockLoop > 100)) {
	    // About to fail, so enable debug to see what's not settling.
	    // Note you must run make with OPT=-DVL_DEBUG for debug prints.
	    int __Vsaved_debug = Verilated::debug();
	    Verilated::debug(1);
	    __Vchange = _change_request(vlSymsp);
	    Verilated::debug(__Vsaved_debug);
	    VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Verilated model didn't DC converge");
	} else {
	    __Vchange = _change_request(vlSymsp);
	}
    } while (VL_UNLIKELY(__Vchange));
}

//--------------------
// Internal Methods

VL_INLINE_OPT void Vtop::_sequent__TOP__1(Vtop__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_sequent__TOP__1\n"); );
    Vtop* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    // Begin mtask footprint  all: 
    VL_SIG8(__Vdly__top__DOT__U2__DOT__cnt,3,0);
    // Body
    __Vdly__top__DOT__U2__DOT__cnt = vlTOPp->top__DOT__U2__DOT__cnt;
    // ALWAYS at ../..//counter.v:30
    if (vlTOPp->push_switch6) {
	__Vdly__top__DOT__U2__DOT__cnt = 0U;
    } else {
	if ((2U == (IData)(vlTOPp->top__DOT__U1__DOT__state))) {
	    __Vdly__top__DOT__U2__DOT__cnt = (0xfU 
					      & ((9U 
						  == (IData)(vlTOPp->top__DOT__U2__DOT__cnt))
						  ? 0U
						  : 
						 ((IData)(1U) 
						  + (IData)(vlTOPp->top__DOT__U2__DOT__cnt))));
	}
    }
    vlTOPp->top__DOT__U2__DOT__cnt = __Vdly__top__DOT__U2__DOT__cnt;
    // ALWAYS at ../..//BCHto7SegmentDecoder.v:4
    vlTOPp->__Vtableidx2 = vlTOPp->top__DOT__U2__DOT__cnt;
    vlTOPp->segment6 = vlTOPp->__Vtable2_segment6[vlTOPp->__Vtableidx2];
    // ALWAYS at ../..//PulseGenerator.v:30
    vlTOPp->top__DOT__U1__DOT__state = ((IData)(vlTOPp->push_switch6)
					 ? 0U : (IData)(vlTOPp->top__DOT__U1__DOT__next_state));
}

void Vtop::_settle__TOP__2(Vtop__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_settle__TOP__2\n"); );
    Vtop* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at ../..//BCHto7SegmentDecoder.v:4
    vlTOPp->__Vtableidx2 = vlTOPp->top__DOT__U2__DOT__cnt;
    vlTOPp->segment6 = vlTOPp->__Vtable2_segment6[vlTOPp->__Vtableidx2];
    // ALWAYS at ../..//PulseGenerator.v:17
    vlTOPp->__Vtableidx1 = (((IData)(vlTOPp->push_switch1) 
			     << 2U) | (IData)(vlTOPp->top__DOT__U1__DOT__state));
    vlTOPp->top__DOT__U1__DOT__next_state = vlTOPp->__Vtable1_top__DOT__U1__DOT__next_state
	[vlTOPp->__Vtableidx1];
}

VL_INLINE_OPT void Vtop::_combo__TOP__3(Vtop__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_combo__TOP__3\n"); );
    Vtop* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at ../..//PulseGenerator.v:17
    vlTOPp->__Vtableidx1 = (((IData)(vlTOPp->push_switch1) 
			     << 2U) | (IData)(vlTOPp->top__DOT__U1__DOT__state));
    vlTOPp->top__DOT__U1__DOT__next_state = vlTOPp->__Vtable1_top__DOT__U1__DOT__next_state
	[vlTOPp->__Vtableidx1];
}

void Vtop::_eval(Vtop__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_eval\n"); );
    Vtop* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk)))) {
	vlTOPp->_sequent__TOP__1(vlSymsp);
    }
    vlTOPp->_combo__TOP__3(vlSymsp);
    // Final
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
}

void Vtop::_eval_initial(Vtop__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_eval_initial\n"); );
    Vtop* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
}

void Vtop::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::final\n"); );
    // Variables
    Vtop__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vtop* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vtop::_eval_settle(Vtop__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_eval_settle\n"); );
    Vtop* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__2(vlSymsp);
}

VL_INLINE_OPT QData Vtop::_change_request(Vtop__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_change_request\n"); );
    Vtop* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vtop::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clk & 0xfeU))) {
	Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((push_switch1 & 0xfeU))) {
	Verilated::overWidthError("push_switch1");}
    if (VL_UNLIKELY((push_switch2 & 0xfeU))) {
	Verilated::overWidthError("push_switch2");}
    if (VL_UNLIKELY((push_switch3 & 0xfeU))) {
	Verilated::overWidthError("push_switch3");}
    if (VL_UNLIKELY((push_switch4 & 0xfeU))) {
	Verilated::overWidthError("push_switch4");}
    if (VL_UNLIKELY((push_switch5 & 0xfeU))) {
	Verilated::overWidthError("push_switch5");}
    if (VL_UNLIKELY((push_switch6 & 0xfeU))) {
	Verilated::overWidthError("push_switch6");}
    if (VL_UNLIKELY((dip_switch1 & 0xfeU))) {
	Verilated::overWidthError("dip_switch1");}
    if (VL_UNLIKELY((dip_switch2 & 0xfeU))) {
	Verilated::overWidthError("dip_switch2");}
    if (VL_UNLIKELY((dip_switch3 & 0xfeU))) {
	Verilated::overWidthError("dip_switch3");}
    if (VL_UNLIKELY((dip_switch4 & 0xfeU))) {
	Verilated::overWidthError("dip_switch4");}
    if (VL_UNLIKELY((dip_switch5 & 0xfeU))) {
	Verilated::overWidthError("dip_switch5");}
    if (VL_UNLIKELY((dip_switch6 & 0xfeU))) {
	Verilated::overWidthError("dip_switch6");}
    if (VL_UNLIKELY((dip_switch7 & 0xfeU))) {
	Verilated::overWidthError("dip_switch7");}
    if (VL_UNLIKELY((dip_switch8 & 0xfeU))) {
	Verilated::overWidthError("dip_switch8");}
    if (VL_UNLIKELY((dip_switch9 & 0xfeU))) {
	Verilated::overWidthError("dip_switch9");}
    if (VL_UNLIKELY((dip_switch10 & 0xfeU))) {
	Verilated::overWidthError("dip_switch10");}
}
#endif // VL_DEBUG

void Vtop::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_ctor_var_reset\n"); );
    // Body
    clk = VL_RAND_RESET_I(1);
    push_switch1 = VL_RAND_RESET_I(1);
    push_switch2 = VL_RAND_RESET_I(1);
    push_switch3 = VL_RAND_RESET_I(1);
    push_switch4 = VL_RAND_RESET_I(1);
    push_switch5 = VL_RAND_RESET_I(1);
    push_switch6 = VL_RAND_RESET_I(1);
    segment1 = VL_RAND_RESET_I(7);
    segment2 = VL_RAND_RESET_I(7);
    segment3 = VL_RAND_RESET_I(7);
    segment4 = VL_RAND_RESET_I(7);
    segment5 = VL_RAND_RESET_I(7);
    segment6 = VL_RAND_RESET_I(7);
    dip_switch1 = VL_RAND_RESET_I(1);
    dip_switch2 = VL_RAND_RESET_I(1);
    dip_switch3 = VL_RAND_RESET_I(1);
    dip_switch4 = VL_RAND_RESET_I(1);
    dip_switch5 = VL_RAND_RESET_I(1);
    dip_switch6 = VL_RAND_RESET_I(1);
    dip_switch7 = VL_RAND_RESET_I(1);
    dip_switch8 = VL_RAND_RESET_I(1);
    dip_switch9 = VL_RAND_RESET_I(1);
    dip_switch10 = VL_RAND_RESET_I(1);
    led1_red = VL_RAND_RESET_I(1);
    led2_yellow = VL_RAND_RESET_I(1);
    led3_green = VL_RAND_RESET_I(1);
    led4_red = VL_RAND_RESET_I(1);
    led5_yellow = VL_RAND_RESET_I(1);
    led6_green = VL_RAND_RESET_I(1);
    top__DOT__U1__DOT__state = VL_RAND_RESET_I(2);
    top__DOT__U1__DOT__next_state = VL_RAND_RESET_I(2);
    top__DOT__U2__DOT__cnt = VL_RAND_RESET_I(4);
    __Vtableidx1 = VL_RAND_RESET_I(3);
    __Vtable1_top__DOT__U1__DOT__next_state[0] = 0U;
    __Vtable1_top__DOT__U1__DOT__next_state[1] = 0U;
    __Vtable1_top__DOT__U1__DOT__next_state[2] = 0U;
    __Vtable1_top__DOT__U1__DOT__next_state[3] = 0U;
    __Vtable1_top__DOT__U1__DOT__next_state[4] = 2U;
    __Vtable1_top__DOT__U1__DOT__next_state[5] = 1U;
    __Vtable1_top__DOT__U1__DOT__next_state[6] = 1U;
    __Vtable1_top__DOT__U1__DOT__next_state[7] = 0U;
    __Vtableidx2 = VL_RAND_RESET_I(4);
    __Vtable2_segment6[0] = 0x7eU;
    __Vtable2_segment6[1] = 0x30U;
    __Vtable2_segment6[2] = 0x6dU;
    __Vtable2_segment6[3] = 0x79U;
    __Vtable2_segment6[4] = 0x33U;
    __Vtable2_segment6[5] = 0x5bU;
    __Vtable2_segment6[6] = 0x5fU;
    __Vtable2_segment6[7] = 0x70U;
    __Vtable2_segment6[8] = 0x7fU;
    __Vtable2_segment6[9] = 0x7bU;
    __Vtable2_segment6[10] = 0U;
    __Vtable2_segment6[11] = 0U;
    __Vtable2_segment6[12] = 0U;
    __Vtable2_segment6[13] = 0U;
    __Vtable2_segment6[14] = 0U;
    __Vtable2_segment6[15] = 0U;
}
