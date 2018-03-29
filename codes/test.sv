`include "environment.sv"

class base_test;

bit [15:0] no_of_pkts;
virtual calc2_intf.tb     vif;
virtual calc2_intf.tb_mon_out vif_mon_out;

environment env;

function new (input virtual calc2_intftb vif_in,
              input virtual calc2_intf.tb_mon_out vif_mon_out
	     );
		 
this.vif= vif_in;
this.vif_mon_out=vif_mon_out;
endfunction

task setup(input int num = 500);
no_of_pkts = num;
env = new(vif,vif_mon_in,vif_mon_out,no_of_pkts);
endtask

task run ();
$display("@%0t [TESTCASE] run started \n",$time);
setup();
env.run();
$display("@%0t [TESTCASE] run ended\n",$time);
endtask


endclass