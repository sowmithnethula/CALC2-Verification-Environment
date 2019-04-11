#/*Written By: Sowmith Nethula*/


vlib work
vdel -all
vlib work


vlog hdl/adder.v 
vlog hdl/alu_input_stage.v 
vlog hdl/alu_output_stage.v 
vlog hdl/holdreg.v
vlog hdl/mux_out.v
vlog hdl/priority.v
vlog hdl/shifter.v
vlog hdl/calc2_top.v 

vlog -cover  bcs calc_env/calc2_transaction.sv -sv +acc
vlog -cover  bcs calc_env/calc2_generator.sv -sv +acc
vlog -cover  bcs calc_env/calc2_master.sv -sv +acc
vlog -cover  bcs calc_env/calc2_monitor_in.sv -sv +acc
vlog -cover  bcs calc_env/calc2_monitor.sv -sv +acc
vlog -cover  bcs env/calc2_scoreboard.sv -sv +acc
vlog -cover  bcs env/environment.sv -sv +acc
vlog -cover  bcs env/test.sv -sv +acc
vlog -cover  bcs tests/test_bench.sv -sv +acc
vlog -cover  bcs calc_env/calc2_interfaces.sv -sv +acc
vlog -cover  bcs hdl/top.sv -sv +acc


vsim -coverage work.top

#add wave -r *
do wave.do
run -all
