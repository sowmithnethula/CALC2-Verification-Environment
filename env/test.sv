/*Written By: Sowmith Nethula*/


import env::*;

class basetest;

bit [15:0] no_of_pkts;
virtual calc2_intf.tb     vif;
virtual calc2_intf.tb_mon_out vif_mon_out;
virtual calc2_intf.tb_mon_in vif_mon_in;




environment env;

function new (input virtual calc2_intf.tb vif_in,
              input virtual calc2_intf.tb_mon_out vif_mon_out,
              input virtual calc2_intf.tb_mon_in vif_mon_in
	     );
		 
this.vif= vif_in;
this.vif_mon_out=vif_mon_out;
this.vif_mon_in=vif_mon_in;
endfunction

task setup(input int num = 300);
no_of_pkts = num;
env = new(vif,vif_mon_out,vif_mon_in,no_of_pkts);
endtask




task run ();
$display("@%0t [TESTCASE] run started \n",$time);
setup();
env.run();
env.report();
$display("@%0t [TESTCASE] run ended\n",$time);
endtask


endclass


