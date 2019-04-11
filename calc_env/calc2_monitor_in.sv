/*Written By: Sowmith Nethula*/


package mon_in;

import pkt::*;

class monitor_in;



virtual calc2_intf.tb_mon_in vif;
mailbox #(packet) mbx_mis_p1;//will be connected to input of scoreboard
mailbox #(packet) mbx_mis_p2;
mailbox #(packet) mbx_mis_p3;
mailbox #(packet) mbx_mis_p4;

string name;

bit [15:0] no_of_pkts_captured_p1;
bit [15:0] no_of_pkts_captured_p2;
bit [15:0] no_of_pkts_captured_p3;
bit [15:0] no_of_pkts_captured_p4;

packet   in_pkt_capture_p1;
packet   in_pkt_capture_p2;
packet   in_pkt_capture_p3;
packet   in_pkt_capture_p4;



function new (input mailbox #(packet) mbx_in_p1,
		input mailbox #(packet) mbx_in_p2,
		input mailbox #(packet) mbx_in_p3,
		input mailbox #(packet) mbx_in_p4,
              	input virtual calc2_intf.tb_mon_in vif_in,
	      	input string name="iMonitor");
this.mbx_mis_p1 = mbx_in_p1;
this.mbx_mis_p2 = mbx_in_p2;
this.mbx_mis_p3 = mbx_in_p3;
this.mbx_mis_p4 = mbx_in_p4;

this.vif = vif_in;
this.name=name;
endfunction



////////////////////////////////////////////////////////////////////////////////////

task run_p1();
$display("@%0t [%s] on port1 run started \n",$time,name); 
while(1) 
begin
	wait(vif.cb_mon_in.req1_cmd_in > 0);

	in_pkt_capture_p1 = new;
	#1;
	if (vif.cb_mon_in.req1_cmd_in > 0)
	begin
		in_pkt_capture_p1.icmd  = vif.cb_mon_in.req1_cmd_in;
		in_pkt_capture_p1.itag  = vif.cb_mon_in.req1_tag_in;
		in_pkt_capture_p1.idataa  = vif.cb_mon_in.req1_data_in;
		in_pkt_capture_p1.itime = $time;
	end

	wait(vif.cb_mon_in.req1_cmd_in == 0);

	#1;
	if (vif.cb_mon_in.req1_cmd_in == 0)
	begin
		in_pkt_capture_p1.idatab  = vif.cb_mon_in.req1_data_in;
	end

	in_pkt_capture_p1.print_in_cap();
	in_pkt_capture_p1.exp_op_calculate();
	mbx_mis_p1.put(in_pkt_capture_p1);
	no_of_pkts_captured_p1++;
	$display("@%0t [%s] on port 1 Sent packet %0d to scoreboard \n",$time,name,no_of_pkts_captured_p1); 
end

$display("@%0t [%s] on port 1 run ended \n",$time,name);//monitor will never end 
endtask

////////////////////////////////////////////////////////////////////////////////////

task run_p2();
$display("@%0t [%s] on port2 run started \n",$time,name); 
while(1) 
begin
	wait(vif.cb_mon_in.req2_cmd_in > 0);

	in_pkt_capture_p2 = new;
	#1;

	if (vif.cb_mon_in.req2_cmd_in > 0)
	begin
		in_pkt_capture_p2.icmd  = vif.cb_mon_in.req2_cmd_in;
		in_pkt_capture_p2.itag  = vif.cb_mon_in.req2_tag_in;
		in_pkt_capture_p2.idataa  = vif.cb_mon_in.req2_data_in;
		in_pkt_capture_p2.itime = $time;
	end

	wait(vif.cb_mon_in.req2_cmd_in == 0);

	#1;

	if (vif.cb_mon_in.req2_cmd_in == 0)
	begin
		in_pkt_capture_p2.idatab  = vif.cb_mon_in.req2_data_in;
	end

	in_pkt_capture_p2.print_in_cap();
	in_pkt_capture_p2.exp_op_calculate();
	mbx_mis_p2.put(in_pkt_capture_p2);
	no_of_pkts_captured_p2++;
	$display("@%0t [%s] on port 2 Sent packet %0d to scoreboard \n",$time,name,no_of_pkts_captured_p3); 
end

$display("@%0t [%s] on port 2 run ended \n",$time,name);//monitor will never end 
endtask

////////////////////////////////////////////////////////////////////////////////////

task run_p3();
$display("@%0t [%s] on port3 run started \n",$time,name); 
while(1) 
begin
	wait(vif.cb_mon_in.req3_cmd_in > 0);

	in_pkt_capture_p3 = new;
	#1;
	if (vif.cb_mon_in.req3_cmd_in > 0)
	begin
		in_pkt_capture_p3.icmd  = vif.cb_mon_in.req3_cmd_in;
		in_pkt_capture_p3.itag  = vif.cb_mon_in.req3_tag_in;
		in_pkt_capture_p3.idataa  = vif.cb_mon_in.req3_data_in;
		in_pkt_capture_p3.itime = $time;
	end

	wait(vif.cb_mon_in.req3_cmd_in == 0);

	#1;

	if (vif.cb_mon_in.req3_cmd_in == 0)
	begin
		in_pkt_capture_p3.idatab  = vif.cb_mon_in.req3_data_in;
	end

	in_pkt_capture_p3.print_in_cap();
	in_pkt_capture_p3.exp_op_calculate();
	mbx_mis_p3.put(in_pkt_capture_p3);
	no_of_pkts_captured_p3++;
	$display("@%0t [%s] on port 3 Sent packet %0d to scoreboard \n",$time,name,no_of_pkts_captured_p3); 
end

$display("@%0t [%s] on port 3 run ended \n",$time,name);//monitor will never end 
endtask

////////////////////////////////////////////////////////////////////////////////////

task run_p4();
$display("@%0t [%s] on port4 run started \n",$time,name); 
while(1) 
begin
	wait(vif.cb_mon_in.req4_cmd_in > 0);
	in_pkt_capture_p4 = new;
	#1;
	if (vif.cb_mon_in.req4_cmd_in > 0)
	begin
		in_pkt_capture_p4.icmd  = vif.cb_mon_in.req4_cmd_in;
		in_pkt_capture_p4.itag  = vif.cb_mon_in.req4_tag_in;
		in_pkt_capture_p4.idataa  = vif.cb_mon_in.req4_data_in;
		in_pkt_capture_p4.itime = $time;
	end
	wait(vif.cb_mon_in.req4_cmd_in == 0);
	#1;
	if (vif.cb_mon_in.req4_cmd_in == 0)
	begin
		in_pkt_capture_p4.idatab  = vif.cb_mon_in.req4_data_in;
	end

	in_pkt_capture_p4.print_in_cap();
	in_pkt_capture_p4.exp_op_calculate();
	mbx_mis_p4.put(in_pkt_capture_p4);
	no_of_pkts_captured_p4++;
	$display("@%0t [%s] on port 4 Sent packet %0d to scoreboard \n",$time,name,no_of_pkts_captured_p4); 
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
$display("@%0t [%s] on port 1 Report: total_packets_received=%0d \n",$time,name,no_of_pkts_captured_p1); 
$display("@%0t [%s] on port 2 Report: total_packets_received=%0d \n",$time,name,no_of_pkts_captured_p2); 
$display("@%0t [%s] on port 3 Report: total_packets_received=%0d \n",$time,name,no_of_pkts_captured_p3); 
$display("@%0t [%s] on port 4 Report: total_packets_received=%0d \n",$time,name,no_of_pkts_captured_p4); 
endfunction


endclass

endpackage
