/*Written By: Sowmith Nethula*/


package DRV;

import pkt::*;

class driver;

//`include "calc_env/calc2_transaction.sv"

bit [15:0] no_of_pkts_recvd_p1;
bit [15:0] no_of_pkts_recvd_p2;
bit [15:0] no_of_pkts_recvd_p3;
bit [15:0] no_of_pkts_recvd_p4;

virtual calc2_intf.tb vif; //creating a virtual interface

packet pkt_p1;
packet pkt_p2;
packet pkt_p3;
packet pkt_p4;

mailbox #(packet) mbx_gd_p1;
mailbox #(packet) mbx_gd_p2;
mailbox #(packet) mbx_gd_p3;
mailbox #(packet) mbx_gd_p4;


function new (input mailbox #(packet) mbx_in_p1,
		input mailbox #(packet) mbx_in_p2,
		input mailbox #(packet) mbx_in_p3,
		input mailbox #(packet) mbx_in_p4,
	      	input virtual calc2_intf.tb vif_in);
this.mbx_gd_p1  = mbx_in_p1;
this.mbx_gd_p2  = mbx_in_p2;
this.mbx_gd_p3  = mbx_in_p3;
this.mbx_gd_p4  = mbx_in_p4;
this.vif  = vif_in;
endfunction

task drive_port1();
@(posedge vif.cb);
$display("@%0t [DRIVER] write to port 1 \n",$time); 
vif.cb.req1_cmd_in <= pkt_p1.cmd; //sending opcodes
vif.cb.req1_tag_in <= pkt_p1.tag; //sending tags
vif.cb.req1_data_in <= pkt_p1.dataa; //sending data
@(negedge vif.cb)
vif.cb.req1_cmd_in <= 0;
vif.cb.req1_tag_in <= 0;
vif.cb.req1_data_in <= pkt_p1.datab;
@(posedge vif.cb);
endtask

task drive_port2();
@(posedge vif.cb);
$display("@%0t [DRIVER] write to port 2 \n",$time); 
vif.cb.req2_cmd_in <= pkt_p2.cmd; //sending opcodes
vif.cb.req2_tag_in <= pkt_p2.tag; //sending tags
vif.cb.req2_data_in <= pkt_p2.dataa; //sending data
@(negedge vif.cb)
vif.cb.req2_cmd_in <= 0;
vif.cb.req2_tag_in <= 0;
vif.cb.req2_data_in <= pkt_p2.datab;
@(posedge vif.cb);
endtask

task drive_port3();
@(posedge vif.cb);
$display("@%0t [DRIVER] write to port 3 \n",$time); 
vif.cb.req3_cmd_in <= pkt_p3.cmd; //sending opcodes
vif.cb.req3_tag_in <= pkt_p3.tag; //sending tags
vif.cb.req3_data_in <= pkt_p3.dataa; //sending data
@(negedge vif.cb)
vif.cb.req3_cmd_in <= 0;
vif.cb.req3_tag_in <= 0;
vif.cb.req3_data_in <= pkt_p3.datab;
@(posedge vif.cb);
endtask

task drive_port4();
@(posedge vif.cb);
$display("@%0t [DRIVER] write to port 4 \n",$time); 
vif.cb.req4_cmd_in <= pkt_p4.cmd; //sending opcodes
vif.cb.req4_tag_in <= pkt_p4.tag; //sending tags
vif.cb.req4_data_in <= pkt_p4.dataa; //sending data
@(negedge vif.cb)
vif.cb.req4_cmd_in <= 0;
vif.cb.req4_tag_in <= 0;
vif.cb.req4_data_in <= pkt_p4.datab;
@(posedge vif.cb);
endtask

task run_p1();
init_p1();
$display("@%0t [DRIVER] port 1 run started \n",$time); 
while(1) //driver runs forever 
begin
mbx_gd_p1.get(pkt_p1);
no_of_pkts_recvd_p1++;
$display("@%0t [DRIVER] Received packet %0d from generator for port 1 \n",$time,no_of_pkts_recvd_p1); 
drive_port1();
pkt_p1.print_in();
pkt_p1.print_exp();
end//end_of_while
$display("@%0t [DRIVER] port 1 run ended \n",$time); 
endtask

task run_p2();
init_p2();
$display("@%0t [DRIVER] port 2 run started \n",$time); 
while(1) //driver runs forever 
begin
mbx_gd_p2.get(pkt_p2);
no_of_pkts_recvd_p2++;
$display("@%0t [DRIVER] Received packet %0d from generator for port 2 \n",$time,no_of_pkts_recvd_p2); 
drive_port2();
pkt_p2.print_in();
pkt_p2.print_exp();
end//end_of_while
$display("@%0t [DRIVER] port 2 run ended \n",$time); 
endtask

task run_p3();
init_p3();
$display("@%0t [DRIVER] port 3 run started \n",$time); 
while(1) //driver runs forever 
begin
mbx_gd_p3.get(pkt_p3);
no_of_pkts_recvd_p3++;
$display("@%0t [DRIVER] Received packet %0d from generator for port 3 \n",$time,no_of_pkts_recvd_p3); 
drive_port3();
pkt_p3.print_in();
pkt_p3.print_exp();
end//end_of_while
$display("@%0t [DRIVER] port 3 run ended \n",$time); 
endtask

task run_p4();
init_p4();
$display("@%0t [DRIVER] port 4 run started \n",$time); 
while(1) //driver runs forever 
begin
mbx_gd_p4.get(pkt_p4);
no_of_pkts_recvd_p4++;
$display("@%0t [DRIVER] Received packet %0d from generator for port 4 \n",$time,no_of_pkts_recvd_p4); 
drive_port4();
pkt_p4.print_in();
pkt_p4.print_exp();
end//end_of_while
$display("@%0t [DRIVER] port 4 run ended \n",$time); 
endtask

task init_p1();
vif.cb.req1_cmd_in <= 0;
vif.cb.req1_tag_in <= 0;
vif.cb.req1_data_in <= 0;
repeat (5) @(posedge vif.cb);
endtask

task init_p2();
vif.cb.req2_cmd_in <= 0;
vif.cb.req2_tag_in <= 0;
vif.cb.req2_data_in <= 0;
repeat (5) @(posedge vif.cb);
endtask

task init_p3();
vif.cb.req3_cmd_in <= 0;
vif.cb.req3_tag_in <= 0;
vif.cb.req3_data_in <= 0;
repeat (5) @(posedge vif.cb);
endtask

task init_p4();
vif.cb.req4_cmd_in <= 0;
vif.cb.req4_tag_in <= 0;
vif.cb.req4_data_in <= 0;
repeat (5) @(posedge vif.cb);
endtask


function void report(input string str="Driver");
$display("@%0t [%s] Report: total_packets_driven on port 1 = %0d \n",$time,str,no_of_pkts_recvd_p1);
$display("@%0t [%s] Report: total_packets_driven on port 2 = %0d \n",$time,str,no_of_pkts_recvd_p2);
$display("@%0t [%s] Report: total_packets_driven on port 3 = %0d \n",$time,str,no_of_pkts_recvd_p3);
$display("@%0t [%s] Report: total_packets_driven on port 4 = %0d \n",$time,str,no_of_pkts_recvd_p4);
endfunction

endclass

endpackage
