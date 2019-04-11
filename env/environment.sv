/*Written By: Sowmith Nethula*/

package env;

import pkt::*;
import gen::*;
import DRV::*;
import mon::*;
import mon_in::*;
import scb::*;

class environment;
bit [15:0] no_of_pkts;//assigned in testcase

mailbox #(packet) gen_drv_mbox_p1; //will be connected to generator and driver
mailbox #(packet) gen_drv_mbox_p2;
mailbox #(packet) gen_drv_mbox_p3;
mailbox #(packet) gen_drv_mbox_p4;

mailbox #(packet) monin_scb_mbox_p1;//will be connected to input monitor and mon_in in scoreborad
mailbox #(packet) monin_scb_mbox_p2;
mailbox #(packet) monin_scb_mbox_p3;
mailbox #(packet) monin_scb_mbox_p4;

mailbox #(packet) mon_scb_mbox_p1;//will be connected to output monitor and mon_out in scoreborad
mailbox #(packet) mon_scb_mbox_p2;
mailbox #(packet) mon_scb_mbox_p3;
mailbox #(packet) mon_scb_mbox_p4;

virtual calc2_intf.tb     vif;
virtual calc2_intf.tb_mon_out vif_mon_out;
virtual calc2_intf.tb_mon_in vif_mon_in;



generator gen;
driver drvr;
monitor_out mon_out;
monitor_in mon_in;
scoreboard scb;

function new (input virtual calc2_intf.tb vif_in,
              input virtual calc2_intf.tb_mon_out vif_mon_out,
              input virtual calc2_intf.tb_mon_in vif_mon_in,
	      input bit [15:0] no_of_pkts);
this.vif= vif_in;
this.vif_mon_out=vif_mon_out;
this.vif_mon_in=vif_mon_in;
this.no_of_pkts=no_of_pkts;
endfunction

function void build();
$display("@%0t [Environment] build started \n",$time); 
gen_drv_mbox_p1 = new;
gen_drv_mbox_p2 = new;
gen_drv_mbox_p3 = new;
gen_drv_mbox_p4 = new;

monin_scb_mbox_p1 = new;
monin_scb_mbox_p2 = new;
monin_scb_mbox_p3 = new;
monin_scb_mbox_p4 = new;

mon_scb_mbox_p1 = new;
mon_scb_mbox_p2 = new;
mon_scb_mbox_p3 = new;
mon_scb_mbox_p4 = new;

gen               = new(gen_drv_mbox_p1,gen_drv_mbox_p2,gen_drv_mbox_p3,gen_drv_mbox_p4,no_of_pkts);
drvr              = new(gen_drv_mbox_p1,gen_drv_mbox_p2,gen_drv_mbox_p3,gen_drv_mbox_p4,vif);
mon_out           = new(mon_scb_mbox_p1,mon_scb_mbox_p2,mon_scb_mbox_p3,mon_scb_mbox_p4,vif_mon_out,"oMonitor");
mon_in           = new(monin_scb_mbox_p1,monin_scb_mbox_p2,monin_scb_mbox_p3,monin_scb_mbox_p4,vif_mon_in,"iMonitor");
scb               = new(monin_scb_mbox_p1,monin_scb_mbox_p2,monin_scb_mbox_p3,monin_scb_mbox_p4,mon_scb_mbox_p1,mon_scb_mbox_p2,mon_scb_mbox_p3,mon_scb_mbox_p4);
$display("@%0t [Environment] build ended\n",$time); 
endfunction

task run();
$display("@%0t [Environment] run started \n",$time); 
build();//contruct the components

fork

gen.add_direct();
gen.sub_direct();
gen.sl_direct();
gen.sr_direct();
gen.corner_direct();
gen.run_p1(); //start the generator
gen.run_p2();
gen.run_p3();
gen.run_p4();

join

//Start all the components of environment
fork
	drvr.run_p1();
	drvr.run_p2();
	drvr.run_p3();
	drvr.run_p4();
	mon_out.run();
	mon_in.run();
	scb.run();
	wait(no_of_pkts == scb.total_pkts_recvd_p1);
join_any


repeat(10) @(vif.cb);
$display("@%0t [Environment] run ended \n",$time); 
endtask

function void report();

scb.comp();

$display("[Environment] *********** Report Started ***************** \n"); 
gen.report();
drvr.report();
mon_out.report();


$display("********************************************************** \n"); 
if(scb.error == 0 )
$display("***************TEST PASSED ******************************* \n"); 
else 
begin
$display("***************TEST FAILED ******************************* \n"); 
end

$display("********************************************************** \n"); 

$display("[Environment] *********** Report ended******************** \n"); 
endfunction

endclass

endpackage
