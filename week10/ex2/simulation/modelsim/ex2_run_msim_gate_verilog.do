transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {ex2.vo}

vlog -vlog01compat -work work +incdir+D:/Projects/FPGA/week10/ex2 {D:/Projects/FPGA/week10/ex2/full_adder.v}
vlog -vlog01compat -work work +incdir+D:/Projects/FPGA/week10/ex2 {D:/Projects/FPGA/week10/ex2/testbench.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  testbench

do D:/Projects/FPGA/week10/ex2/Tcl_script1.tcl
