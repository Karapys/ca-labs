transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {control_unit.vo}

vlog -vlog01compat -work work +incdir+D:/Projects/FPGA/week13/control_unit {D:/Projects/FPGA/week13/control_unit/testbench.v}
vlog -vlog01compat -work work +incdir+D:/Projects/FPGA/week13/control_unit {D:/Projects/FPGA/week13/control_unit/main_decoder.v}
vlog -vlog01compat -work work +incdir+D:/Projects/FPGA/week13/control_unit {D:/Projects/FPGA/week13/control_unit/control_unit.v}
vlog -vlog01compat -work work +incdir+D:/Projects/FPGA/week13/control_unit {D:/Projects/FPGA/week13/control_unit/alu_decoder.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  testbench

do D:/Projects/FPGA/week13/control_unit/Tcl_script1.tcl
