/*Written By: Sowmith Nethula*/


package mon;

import pkt::*;

class monitor_out;



virtual calc2_intf.tb_mon_out vif;
mailbox #(packet) mbx_ms_p1;//will be connected to input of scoreboard
mailbox #(packet) mbx_ms_p2;
mailbox #(packet) mbx_ms_p3;
mailbox #(packet) mbx_ms_p4;

string name;

bit [15:0] no_of_pkts_recvd_p1;
bit [15:0] no_of_pkts_recvd_p2;
bit [15:0] no_of_pkts_recvd_p3;
bit [15:0] no_of_pkts_recvd_p4;

packet   pkt_capture_p1;
packet   pkt_capture_p2;
packet   pkt_capture_p3;
packet   pkt_capture_p4;



function new (input mailbox #(packet) mbx_in_p1,
		input mailbox #(packet) mbx_in_p2,
		input mailbox #(packet) mbx_in_p3,
		input mailbox #(packet) mbx_in_p4,
              	input virtual calc2_intf.tb_mon_out vif_in,
	      	input string name="oMonitor");
this.mbx_ms_p1 = mbx_in_p1;
this.mbx_ms_p2 = mbx_in_p2;
this.mbx_ms_p3 = mbx_in_p3;
this.mbx_ms_p4 = mbx_in_p4;

this.vif = vif_in;
this.name=name;
endfunction



////////////////////////////////////////////////////////////////////////////////////

task run_p1();
$display("@%0t [%s] on port1 run started \n",$time,name); 
while(1) 
begin
@(posedge vif.cb_mon_out.out_resp1);

pkt_capture_p1 = new;

if (vif.cb_mon_out.out_resp1 > 0)
begin
	pkt_capture_p1.cap_out_data  = vif.cb_mon_out.out_data1;
	pkt_capture_p1.cap_tag  = vif.cb_mon_out.out_tag1;
	pkt_capture_p1.cap_resp  = vif.cb_mon_out.out_resp1;
	pkt_capture_p1.captime = $time;
end
pkt_capture_p1.print_cap();
mbx_ms_p1.put(pkt_capture_p1);
no_of_pkts_recvd_p1++;
$display("@%0t [%s] on port 1 Sent packet %0d to scoreboard \n",$time,name,no_of_pkts_recvd_p1); 
end

$display("@%0t [%s] on port 1 run ended \n",$time,name);//monitor will never end 
endtask

////////////////////////////////////////////////////////////////////////////////////

task run_p2();
$display("@%0t [%s] on port2 run started \n",$time,name); 
while(1) 
begin
@(posedge vif.cb_mon_out.out_resp2);

pkt_capture_p2 = new;

if (vif.cb_mon_out.out_resp2 > 0)
begin
	pkt_capture_p2.cap_out_data  = vif.cb_mon_out.out_data2;
	pkt_capture_p2.cap_tag  = vif.cb_mon_out.out_tag2;
	pkt_capture_p2.cap_resp  = vif.cb_mon_out.out_resp2;
	pkt_capture_p2.captime = $time;
end
pkt_capture_p2.print_cap();
mbx_ms_p2.put(pkt_capture_p2);
no_of_pkts_recvd_p2++;
$display("@%0t [%s] on port 2 Sent packet %0d to scoreboard \n",$time,name,no_of_pkts_recvd_p1); 
end

$display("@%0t [%s] on port 2 run ended \n",$time,name);//monitor will never end 
endtask

////////////////////////////////////////////////////////////////////////////////////

task run_p3();
$display("@%0t [%s] on port3 run started \n",$time,name); 
while(1) 
begin
@(posedge vif.cb_mon_out.out_resp3);

pkt_capture_p3 = new;

if (vif.cb_mon_out.out_resp3 > 0)
begin
	pkt_capture_p3.cap_out_data  = vif.cb_mon_out.out_data3;
	pkt_capture_p3.cap_tag  = vif.cb_mon_out.out_tag3;
	pkt_capture_p3.cap_resp  = vif.cb_mon_out.out_resp3;
	pkt_capture_p3.captime = $time;
end
pkt_capture_p3.print_cap();
mbx_ms_p3.put(pkt_capture_p3);
no_of_pkts_recvd_p3++;
$display("@%0t [%s] on port 3 Sent packet %0d to scoreboard \n",$time,name,no_of_pkts_recvd_p3); 
end

$display("@%0t [%s] on port 3 run ended \n",$time,name);//monitor will never end 
endtask

////////////////////////////////////////////////////////////////////////////////////

task run_p4();
$display("@%0t [%s] on port4 run started \n",$time,name); 
while(1) 
begin
@(posedge vif.cb_mon_out.out_resp4);

pkt_capture_p4 = new;

if (vif.cb_mon_out.out_resp4 > 0)
begin
	pkt_capture_p4.cap_out_data  = vif.cb_mon_out.out_data4;
	pkt_capture_p4.cap_tag  = vif.cb_mon_out.out_tag4;
	pkt_capture_p4.cap_resp  = vif.cb_mon_out.out_resp4;
	pkt_capture_p4.captime = $time;
end
pkt_capture_p4.print_cap();
mbx_ms_p4.put(pkt_capture_p4);
no_of_pkts_recvd_p4++;
$display("@%0t [%s] on port 4 Sent packet %0d to scoreboard \n",$time,name,no_of_pkts_recvd_p4); 
end

$display("@%0t [%s] on port 4 run ended \n",$time,name);//monitor will never end 
endtask

////////////////////////////////////////////////////////////////////////////////////

task run();
fork
run_p1();
run_p2();
run_p3();
run_p4();
join
endtask


function void report();
$display("@%0t [%s] on port 1 Report: total_packets_received=%0d \n",$time,name,no_of_pkts_recvd_p1); 
$display("@%0t [%s] on port 2 Report: total_packets_received=%0d \n",$time,name,no_of_pkts_recvd_p2); 
$display("@%0t [%s] on port 3 Report: total_packets_received=%0d \n",$time,name,no_of_pkts_recvd_p3); 
$display("@%0t [%s] on port 4 Report: total_packets_received=%0d \n",$time,name,no_of_pkts_recvd_p4); 
endfunction


endclass

endpackage
