`include "packet.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor_out.sv"
`include "scoreboard.sv"

class environment;
bit [15:0] no_of_pkts;//assigned in testcase
mailbox #(packet) gen_drv_mbox; //will be connected to generator and driver
mailbox #(packet) gen_scb_mbox;//will be connected to input monitor and mon_in in scoreborad
mailbox #(packet) mon_scb_mbox;//will be connected to output monitor and mon_out in scoreborad

virtual calc2_intf.tb     vif;
virtual calc2_intf.tb_mon_out vif_mon_out;

generator gen;
driver drvr;
monitor_out mon_out;
scoreboard scb;

function new (input virtual calc2_intf.tb vif_in,
              input virtual calc2_intf.tb_mon_out vif_mon_out,
	      input bit [15:0] no_of_pkts);
this.vif= vif_in;
this.vif_mon_out=vif_mon_out;
this.no_of_pkts=no_of_pkts;
endfunction

task reset();
$display("@%0t [Environment] *********** Applying reset*********** \n",$time); 
vif.reset=1;
repeat(8) @(vif.cb);
vif.reset=0;
repeat(1) @(vif.cb);
$display("@%0t [Environment] *********** De-asserted reset*********** \n",$time); 
endtask

function void build();
$display("@%0t [Environment] build started \n",$time); 
gen_drv_mbox = new;
gen_scb_mbox = new;
mon_scb_mbox = new;
gen               = new(gen_drv_mbox,no_of_pkts);
drvr              = new(gen_drv_mbox,gen_scb_mbox,vif);
mon_out           = new(mon_scb_mbox,vif_mon_out,"oMonitor");
scb               = new(gen_scb_mbox,mon_scb_mbox);
$display("@%0t [Environment] build ended\n",$time); 
endfunction

task run();
$display("@%0t [Environment] run started \n",$time); 
build();//contruct the components
reset();//Apply reset to design
gen.run();//start the generator
//Start all the components of environment
fork
	drvr.run();
	mon_out.run();
	scb.run();
	wait(no_of_pkts == scb.total_pkts_recvd);
join_any
	repeat(10) @(vif.cb);
report();
$display("@%0t [Environment] run ended \n",$time); 
endtask

function void report();
$display("[Environment] *********** Report Started ***************** \n"); 
gen.report();
drvr.report();
mon_out.report();
scb.report();

$display("********************************************************** \n"); 
if(scb.m_mismatches ==0)
$display("***************TEST PASSED ******************************* \n"); 
else 
begin
$display("***************TEST FAILED ******************************* \n"); 
$display("***************Matches=%0d Mis_matches=%0d *************** \n",scb.m_matches,scb.m_mismatches); 
end

$display("********************************************************** \n"); 

$display("[Environment] *********** Report ended******************** \n"); 
endfunction

endclass