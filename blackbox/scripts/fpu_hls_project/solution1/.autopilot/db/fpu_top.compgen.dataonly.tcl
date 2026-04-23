# This script segment is generated automatically by AutoPilot

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


