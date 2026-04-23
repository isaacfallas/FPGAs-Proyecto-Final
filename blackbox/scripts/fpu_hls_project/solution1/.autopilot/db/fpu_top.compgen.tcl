# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
set port_control {
clk { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
rst_n { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
ce_r { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
valid_in { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
precision { 
	dir I
	width 2
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
op { 
	dir I
	width 2
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
operand_a { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 64
	offset_end 75
}
operand_b { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 76
	offset_end 87
}
valid_out { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 88
	offset_end 95
}
precision_out { 
	dir I
	width 2
	depth 1
	mode ap_none
	offset 96
	offset_end 103
}
result { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 104
	offset_end 115
}
exceptions { 
	dir I
	width 5
	depth 1
	mode ap_none
	offset 116
	offset_end 123
}
}
dict set axilite_register_dict control $port_control


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 1 \
			corename fpu_top_control_axilite \
			name fpu_top_control_s_axi \
			ports {$port_control} \
			op interface \
			interrupt_clear_mode TOW \
			interrupt_trigger_type default \
			is_flushable 0 \
			is_datawidth64 0 \
			is_addrwidth64 1 \
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'control'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler fpu_top_control_s_axi BINDTYPE interface TYPE interface_s_axilite
}


# Adapter definition:
set PortName ap_rst_n
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -1 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_rst_n \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


