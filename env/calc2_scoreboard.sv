/*Written By: Sowmith Nethula*/


package scb;

import pkt::*;

class scoreboard;



bit [15:0] total_pkts_recvd_p1;
bit [15:0] total_pkts_recvd_p2;
bit [15:0] total_pkts_recvd_p3;
bit [15:0] total_pkts_recvd_p4;

bit error;

int m1 = 0;
int m2 = 0;
int m3 = 0;
int m4 = 0;

int m5 = 0;
int m6 = 0;
int m7 = 0;
int m8 = 0;

int m9 = 0;
int m10 = 0;
int m11 = 0;
int m12 = 0;

int m13 = 0;
int m14 = 0;
int m15 = 0;
int m16 = 0;


int p1t0 = 0;
int p1t1 = 0;
int p1t2 = 0;
int p1t3 = 0;

int p2t0 = 0;
int p2t1 = 0;
int p2t2 = 0;
int p2t3 = 0;

int p3t0 = 0;
int p3t1 = 0;
int p3t2 = 0;
int p3t3 = 0;

int p4t0 = 0;
int p4t1 = 0;
int p4t2 = 0;
int p4t3 = 0;


mailbox #(packet) mbx_mis_p1;
mailbox #(packet) mbx_mis_p2;
mailbox #(packet) mbx_mis_p3;
mailbox #(packet) mbx_mis_p4;
 
mailbox #(packet) mbx_ms_p1;
mailbox #(packet) mbx_ms_p2;
mailbox #(packet) mbx_ms_p3;
mailbox #(packet) mbx_ms_p4;

bit [15:0] m_matches_p1;
bit [15:0] m_mismatches_p1;

bit [15:0] m_matches_p2;
bit [15:0] m_mismatches_p2;

bit [15:0] m_matches_p3;
bit [15:0] m_mismatches_p3;

bit [15:0] m_matches_p4;
bit [15:0] m_mismatches_p4;

packet in_pkt_capture_p1;
packet pkt_capture_p1;

packet in_pkt_capture_p2;
packet pkt_capture_p2;

packet in_pkt_capture_p3;
packet pkt_capture_p3;

packet in_pkt_capture_p4;
packet pkt_capture_p4;

///port 1 captured queues
int port1_t0_cap[4][$];
int port1_t1_cap[4][$];
int port1_t2_cap[4][$];
int port1_t3_cap[4][$];

///port 2 captured queues
int port2_t0_cap[4][$];
int port2_t1_cap[4][$];
int port2_t2_cap[4][$];
int port2_t3_cap[4][$];

///port 3 captured queues
int port3_t0_cap[4][$];
int port3_t1_cap[4][$];
int port3_t2_cap[4][$];
int port3_t3_cap[4][$];

///port 4 captured queues
int port4_t0_cap[4][$];
int port4_t1_cap[4][$];
int port4_t2_cap[4][$];
int port4_t3_cap[4][$];

///port 1 expected queues
int port1_t0_exp[4][$];
int port1_t1_exp[4][$];
int port1_t2_exp[4][$];
int port1_t3_exp[4][$];

///port 2 expected queues
int port2_t0_exp[4][$];
int port2_t1_exp[4][$];
int port2_t2_exp[4][$];
int port2_t3_exp[4][$];

///port 3 expected queues
int port3_t0_exp[4][$];
int port3_t1_exp[4][$];
int port3_t2_exp[4][$];
int port3_t3_exp[4][$];

///port 4 expected queues
int port4_t0_exp[4][$];
int port4_t1_exp[4][$];
int port4_t2_exp[4][$];
int port4_t3_exp[4][$];

function new (input mailbox #(packet) mbx_in_p1,
		input mailbox #(packet) mbx_in_p2,
		input mailbox #(packet) mbx_in_p3,
		input mailbox #(packet) mbx_in_p4,
		input mailbox #(packet) mbx_out_p1,
		input mailbox #(packet) mbx_out_p2,
		input mailbox #(packet) mbx_out_p3,
              	input mailbox #(packet) mbx_out_p4);

this.mbx_mis_p1  = mbx_in_p1;
this.mbx_ms_p1 = mbx_out_p1;

this.mbx_mis_p2  = mbx_in_p2;
this.mbx_ms_p2 = mbx_out_p2;

this.mbx_mis_p3  = mbx_in_p3;
this.mbx_ms_p3 = mbx_out_p3;

this.mbx_mis_p4  = mbx_in_p4;
this.mbx_ms_p4 = mbx_out_p4;
endfunction

////////////////////////////////////////////////////////////////////////////////////////
task queue_status();
	$display("---------------------queue status----------------------\n");
	$display("port1_t0_exp = %0p",port1_t0_exp);
	$display("port1_t1_exp = %0p",port1_t1_exp);
	$display("port1_t2_exp = %0p",port1_t2_exp);
	$display("port1_t3_exp = %0p",port1_t3_exp);
	$display("-------------------------------------------------------\n"); 
	$display("port1_t0_cap = %0p",port1_t0_cap);
	$display("port1_t1_cap = %0p",port1_t1_cap);
	$display("port1_t2_cap = %0p",port1_t2_cap);
	$display("port1_t3_cap = %0p",port1_t3_cap);
	$display("-------------------------------------------------------\n"); 
	$display("port2_t0_exp = %0p",port2_t0_exp);
	$display("port2_t1_exp = %0p",port2_t1_exp);
	$display("port2_t2_exp = %0p",port2_t2_exp);
	$display("port2_t3_exp = %0p",port2_t3_exp);
	$display("-------------------------------------------------------\n"); 
	$display("port2_t0_cap = %0p",port2_t0_cap);
	$display("port2_t1_cap = %0p",port2_t1_cap);
	$display("port2_t2_cap = %0p",port2_t2_cap);
	$display("port2_t3_cap = %0p",port2_t3_cap);	
	$display("-------------------------------------------------------\n"); 
	$display("port3_t0_exp = %0p",port3_t0_exp);
	$display("port3_t1_exp = %0p",port3_t1_exp);
	$display("port3_t2_exp = %0p",port3_t2_exp);
	$display("port3_t3_exp = %0p",port3_t3_exp);
	$display("-------------------------------------------------------\n");  
	$display("port3_t0_cap = %0p",port3_t0_cap);
	$display("port3_t1_cap = %0p",port3_t1_cap);
	$display("port3_t2_cap = %0p",port3_t2_cap);
	$display("port3_t3_cap = %0p",port3_t3_cap);	
	$display("-------------------------------------------------------\n"); 
	$display("port4_t0_exp = %0p",port4_t0_exp);
	$display("port4_t1_exp = %0p",port4_t1_exp);
	$display("port4_t2_exp = %0p",port4_t2_exp);
	$display("port4_t3_exp = %0p",port4_t3_exp);
	$display("-------------------------------------------------------\n");	
	$display("port4_t0_cap = %0p",port4_t0_cap);
	$display("port4_t1_cap = %0p",port4_t1_cap);
	$display("port4_t2_cap = %0p",port4_t2_cap);
	$display("port4_t3_cap = %0p",port4_t3_cap);	
	$display("-------------------------------------------------------\n"); 
endtask
///////////////////////////////////////////////////////////////////////////////////////

task frm_gen_p1();
$display("@%0t [scoreboard] collecting data sent from monitor_in on port 1 \n ",$time);
while(1)
begin
	mbx_mis_p1.get(in_pkt_capture_p1);
	$display("-----iMonitor--------after get in scoreboard----------------------\n");
	$display("from iMonitor (input data) tag = %0d, cmd = %0d, data_a = %0d, data_b = %0d",in_pkt_capture_p1.itag, in_pkt_capture_p1.icmd, in_pkt_capture_p1.idataa, in_pkt_capture_p1.idatab);
	$display("from iMonitor (expected data) tag = %0d, resp = %0d, data_out = %0d",in_pkt_capture_p1.exp_tag, in_pkt_capture_p1.exp_resp, in_pkt_capture_p1.exp_out);
	$display("-------------------------------------------------------\n");
	if (in_pkt_capture_p1.exp_tag == 0)
	begin 
	port1_t0_exp[0].push_front(in_pkt_capture_p1.exp_tag);
	port1_t0_exp[1].push_front(in_pkt_capture_p1.exp_resp);
	port1_t0_exp[2].push_front(in_pkt_capture_p1.exp_out);
	port1_t0_exp[3].push_front(in_pkt_capture_p1.itime);
	end
    	else if (in_pkt_capture_p1.exp_tag == 1)
    	begin
	port1_t1_exp[0].push_front(in_pkt_capture_p1.exp_tag);
	port1_t1_exp[1].push_front(in_pkt_capture_p1.exp_resp);
	port1_t1_exp[2].push_front(in_pkt_capture_p1.exp_out);
	port1_t1_exp[3].push_front(in_pkt_capture_p1.itime);
	end   
	else if (in_pkt_capture_p1.exp_tag == 2)
    	begin
	port1_t2_exp[0].push_front(in_pkt_capture_p1.exp_tag);
	port1_t2_exp[1].push_front(in_pkt_capture_p1.exp_resp);
	port1_t2_exp[2].push_front(in_pkt_capture_p1.exp_out);
	port1_t2_exp[3].push_front(in_pkt_capture_p1.itime);
	end 
	else if (in_pkt_capture_p1.exp_tag == 3)
    	begin
	port1_t3_exp[0].push_front(in_pkt_capture_p1.exp_tag);
	port1_t3_exp[1].push_front(in_pkt_capture_p1.exp_resp);
	port1_t3_exp[2].push_front(in_pkt_capture_p1.exp_out);
	port1_t3_exp[3].push_front(in_pkt_capture_p1.itime);
	end
end
endtask

////////////////////////////////////////////////////////////////////////////////////////

task frm_gen_p2();
$display("@%0t [scoreboard] collecting data sent from monitor_in on port 2 \n ",$time);
while(1)
begin
	mbx_mis_p2.get(in_pkt_capture_p2);
	$display("-----iMonitor--------after get in scoreboard----------------------\n");
	$display("from iMonitor (input data) tag = %0d, cmd = %0d, data_a = %0d, data_b = %0d",in_pkt_capture_p2.itag, in_pkt_capture_p2.icmd, in_pkt_capture_p2.idataa, in_pkt_capture_p2.idatab);
	$display("from iMonitor (expected data) tag = %0d, resp = %0d, data_out = %0d",in_pkt_capture_p2.exp_tag, in_pkt_capture_p2.exp_resp, in_pkt_capture_p2.exp_out);
	$display("-------------------------------------------------------\n");
	if (in_pkt_capture_p2.exp_tag == 0)
	begin 
	port2_t0_exp[0].push_front(in_pkt_capture_p2.exp_tag);
	port2_t0_exp[1].push_front(in_pkt_capture_p2.exp_resp);
	port2_t0_exp[2].push_front(in_pkt_capture_p2.exp_out);
	port2_t0_exp[3].push_front(in_pkt_capture_p2.itime);
	end
    	else if (in_pkt_capture_p2.exp_tag == 1)
    	begin
	port2_t1_exp[0].push_front(in_pkt_capture_p2.exp_tag);
	port2_t1_exp[1].push_front(in_pkt_capture_p2.exp_resp);
	port2_t1_exp[2].push_front(in_pkt_capture_p2.exp_out);
	port2_t1_exp[3].push_front(in_pkt_capture_p2.itime);
	end   
	else if (in_pkt_capture_p2.exp_tag == 2)
    	begin
	port2_t2_exp[0].push_front(in_pkt_capture_p2.exp_tag);
	port2_t2_exp[1].push_front(in_pkt_capture_p2.exp_resp);
	port2_t2_exp[2].push_front(in_pkt_capture_p2.exp_out);
	port2_t2_exp[3].push_front(in_pkt_capture_p2.itime);
	end 
	else if (in_pkt_capture_p2.exp_tag == 3)
    	begin
	port2_t3_exp[0].push_front(in_pkt_capture_p2.exp_tag);
	port2_t3_exp[1].push_front(in_pkt_capture_p2.exp_resp);
	port2_t3_exp[2].push_front(in_pkt_capture_p2.exp_out);
	port2_t3_exp[3].push_front(in_pkt_capture_p2.itime);
	end	
end

endtask

////////////////////////////////////////////////////////////////////////////////////////

task frm_gen_p3();
$display("@%0t [scoreboard] collecting data sent from monitor_in on port 3 \n ",$time);
while(1)
begin
	mbx_mis_p3.get(in_pkt_capture_p3);
	$display("-----iMonitor--------after get in scoreboard----------------------\n");
	$display("from iMonitor (input data) tag = %0d, cmd = %0d, data_a = %0d, data_b = %0d",in_pkt_capture_p3.itag, in_pkt_capture_p3.icmd, in_pkt_capture_p3.idataa, in_pkt_capture_p3.idatab);
	$display("from iMonitor (expected data) tag = %0d, resp = %0d, data_out = %0d",in_pkt_capture_p3.exp_tag, in_pkt_capture_p3.exp_resp, in_pkt_capture_p3.exp_out);
	$display("-------------------------------------------------------\n");
	if (in_pkt_capture_p3.exp_tag == 0)
	begin 
	port3_t0_exp[0].push_front(in_pkt_capture_p3.exp_tag);
	port3_t0_exp[1].push_front(in_pkt_capture_p3.exp_resp);
	port3_t0_exp[2].push_front(in_pkt_capture_p3.exp_out);
	port3_t0_exp[3].push_front(in_pkt_capture_p3.itime);
	end
    	else if (in_pkt_capture_p3.exp_tag == 1)
    	begin
	port3_t1_exp[0].push_front(in_pkt_capture_p3.exp_tag);
	port3_t1_exp[1].push_front(in_pkt_capture_p3.exp_resp);
	port3_t1_exp[2].push_front(in_pkt_capture_p3.exp_out);
	port3_t1_exp[3].push_front(in_pkt_capture_p3.itime);
	end   
	else if (in_pkt_capture_p3.exp_tag == 2)
    	begin
	port3_t2_exp[0].push_front(in_pkt_capture_p3.exp_tag);
	port3_t2_exp[1].push_front(in_pkt_capture_p3.exp_resp);
	port3_t2_exp[2].push_front(in_pkt_capture_p3.exp_out);
	port3_t2_exp[3].push_front(in_pkt_capture_p3.itime);
	end 
	else if (in_pkt_capture_p3.exp_tag == 3)
    	begin
	port3_t3_exp[0].push_front(in_pkt_capture_p3.exp_tag);
	port3_t3_exp[1].push_front(in_pkt_capture_p3.exp_resp);
	port3_t3_exp[2].push_front(in_pkt_capture_p3.exp_out);
	port3_t3_exp[3].push_front(in_pkt_capture_p3.itime);
	end
	  	
end

endtask

////////////////////////////////////////////////////////////////////////////////////////

task frm_gen_p4();
$display("@%0t [scoreboard] collecting data sent from monitor_in on port 4 \n ",$time);
while(1)
begin
	mbx_mis_p4.get(in_pkt_capture_p4);
	$display("-----iMonitor--------after get in scoreboard----------------------\n");
	$display("from iMonitor (input data) tag = %0d, cmd = %0d, data_a = %0d, data_b = %0d",in_pkt_capture_p4.itag, in_pkt_capture_p4.icmd, in_pkt_capture_p4.idataa, in_pkt_capture_p4.idatab);
	$display("from iMonitor (expected data) tag = %0d, resp = %0d, data_out = %0d",in_pkt_capture_p4.exp_tag, in_pkt_capture_p4.exp_resp, in_pkt_capture_p4.exp_out);
	$display("-------------------------------------------------------\n");
	if (in_pkt_capture_p4.exp_tag == 0)
	begin 
	port4_t0_exp[0].push_front(in_pkt_capture_p4.exp_tag);
	port4_t0_exp[1].push_front(in_pkt_capture_p4.exp_resp);
	port4_t0_exp[2].push_front(in_pkt_capture_p4.exp_out);
	port4_t0_exp[3].push_front(in_pkt_capture_p4.itime);
	end
    	else if (in_pkt_capture_p4.exp_tag == 1)
    	begin
	port4_t1_exp[0].push_front(in_pkt_capture_p4.exp_tag);
	port4_t1_exp[1].push_front(in_pkt_capture_p4.exp_resp);
	port4_t1_exp[2].push_front(in_pkt_capture_p4.exp_out);
	port4_t1_exp[3].push_front(in_pkt_capture_p4.itime);
	end   
	else if (in_pkt_capture_p4.exp_tag == 2)
    	begin
	port4_t2_exp[0].push_front(in_pkt_capture_p4.exp_tag);
	port4_t2_exp[1].push_front(in_pkt_capture_p4.exp_resp);
	port4_t2_exp[2].push_front(in_pkt_capture_p4.exp_out);
	port4_t2_exp[3].push_front(in_pkt_capture_p4.itime);
	end 
	else if (in_pkt_capture_p4.exp_tag == 3)
    	begin
	port4_t3_exp[0].push_front(in_pkt_capture_p4.exp_tag);
	port4_t3_exp[1].push_front(in_pkt_capture_p4.exp_resp);
	port4_t3_exp[2].push_front(in_pkt_capture_p4.exp_out);
	port4_t3_exp[3].push_front(in_pkt_capture_p4.itime);
	end
	  	
end

endtask
////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////

task run_p1() ;
	$display("@%0t [SCOREBOARD] on port 1 run started \n",$time); 
		while(1) 
		begin
			
			mbx_ms_p1.get(pkt_capture_p1);
			total_pkts_recvd_p1++;
			$display("---------------------after get in scoreboard(port 1)----------------------\n");
			$display("from mon (captured data) tag = %0d, resp = %0d, data_out = %0d",pkt_capture_p1.cap_tag,pkt_capture_p1.cap_resp,pkt_capture_p1.cap_out_data);
			$display("-------------------------------------------------------\n");
			$display("@%0t [SCOREBOARD] on port 1 Packet %0d received \n",$time,total_pkts_recvd_p1); 
			
			if (pkt_capture_p1.cap_tag == 0)
			begin 
			port1_t0_cap[0].push_front(pkt_capture_p1.cap_tag);
			port1_t0_cap[1].push_front(pkt_capture_p1.cap_resp);
			port1_t0_cap[2].push_front(pkt_capture_p1.cap_out_data);
			port1_t0_cap[3].push_front(pkt_capture_p1.captime);
			end
		    	else if (pkt_capture_p1.cap_tag == 1)
		    	begin
			port1_t1_cap[0].push_front(pkt_capture_p1.cap_tag);
			port1_t1_cap[1].push_front(pkt_capture_p1.cap_resp);
			port1_t1_cap[2].push_front(pkt_capture_p1.cap_out_data);
			port1_t1_cap[3].push_front(pkt_capture_p1.captime);
			end   
			else if (pkt_capture_p1.cap_tag == 2)
		    	begin
			port1_t2_cap[0].push_front(pkt_capture_p1.cap_tag);
			port1_t2_cap[1].push_front(pkt_capture_p1.cap_resp);
			port1_t2_cap[2].push_front(pkt_capture_p1.cap_out_data);
			port1_t2_cap[3].push_front(pkt_capture_p1.captime);
			end 
			else if (pkt_capture_p1.cap_tag == 3)
		    	begin
			port1_t3_cap[0].push_front(pkt_capture_p1.cap_tag);
			port1_t3_cap[1].push_front(pkt_capture_p1.cap_resp);
			port1_t3_cap[2].push_front(pkt_capture_p1.cap_out_data);
			port1_t3_cap[3].push_front(pkt_capture_p1.captime);
			end
		end

	$display("@%0t [SCOREBOARD] on port 1 run ended \n",$time); 
endtask

////////////////////////////////////////////////////////////////////////////////////////

task run_p2() ;
	$display("@%0t [SCOREBOARD] on port 2 run started \n",$time); 
		while(1) 
		begin
			
			mbx_ms_p2.get(pkt_capture_p2);
			total_pkts_recvd_p2++;
			$display("---------------------after get in scoreboard(port 2)----------------------\n");
			$display("from mon (captured data) tag = %0d, resp = %0d, data_out = %0d",pkt_capture_p2.cap_tag,pkt_capture_p2.cap_resp,pkt_capture_p2.cap_out_data);
			$display("-------------------------------------------------------\n");
			$display("@%0t [SCOREBOARD] on port 2 Packet %0d received \n",$time,total_pkts_recvd_p2); 
			
			if (pkt_capture_p2.cap_tag == 0)
			begin 
			port2_t0_cap[0].push_front(pkt_capture_p2.cap_tag);
			port2_t0_cap[1].push_front(pkt_capture_p2.cap_resp);
			port2_t0_cap[2].push_front(pkt_capture_p2.cap_out_data);
			port2_t0_cap[3].push_front(pkt_capture_p2.captime);
			end
		    	else if (pkt_capture_p2.cap_tag == 1)
		    	begin
			port2_t1_cap[0].push_front(pkt_capture_p2.cap_tag);
			port2_t1_cap[1].push_front(pkt_capture_p2.cap_resp);
			port2_t1_cap[2].push_front(pkt_capture_p2.cap_out_data);
			port2_t1_cap[3].push_front(pkt_capture_p2.captime);
			end   
			else if (pkt_capture_p2.cap_tag == 2)
		    	begin
			port2_t2_cap[0].push_front(pkt_capture_p2.cap_tag);
			port2_t2_cap[1].push_front(pkt_capture_p2.cap_resp);
			port2_t2_cap[2].push_front(pkt_capture_p2.cap_out_data);
			port2_t2_cap[3].push_front(pkt_capture_p2.captime);
			end 
			else if (pkt_capture_p2.cap_tag == 3)
		    	begin
			port2_t3_cap[0].push_front(pkt_capture_p2.cap_tag);
			port2_t3_cap[1].push_front(pkt_capture_p2.cap_resp);
			port2_t3_cap[2].push_front(pkt_capture_p2.cap_out_data);
			port2_t3_cap[3].push_front(pkt_capture_p2.captime);
			end

		end

	$display("@%0t [SCOREBOARD] on port 2 run ended \n",$time); 
endtask

////////////////////////////////////////////////////////////////////////////////////////

task run_p3() ;
	$display("@%0t [SCOREBOARD] on port 3 run started \n",$time); 
		while(1) 
		begin
			
			mbx_ms_p3.get(pkt_capture_p3);
			total_pkts_recvd_p3++;
			$display("---------------------after get in scoreboard(port 3)----------------------\n");
			$display("from mon (captured data) tag = %0d, resp = %0d, data_out = %0d",pkt_capture_p3.cap_tag,pkt_capture_p3.cap_resp,pkt_capture_p3.cap_out_data);
			$display("-------------------------------------------------------\n");
			$display("@%0t [SCOREBOARD] on port 3 Packet %0d received \n",$time,total_pkts_recvd_p3); 
			
			if (pkt_capture_p3.cap_tag == 0)
			begin 
			port3_t0_cap[0].push_front(pkt_capture_p3.cap_tag);
			port3_t0_cap[1].push_front(pkt_capture_p3.cap_resp);
			port3_t0_cap[2].push_front(pkt_capture_p3.cap_out_data);
			port3_t0_cap[3].push_front(pkt_capture_p3.captime);
			end
		    	else if (pkt_capture_p3.cap_tag == 1)
		    	begin
			port3_t1_cap[0].push_front(pkt_capture_p3.cap_tag);
			port3_t1_cap[1].push_front(pkt_capture_p3.cap_resp);
			port3_t1_cap[2].push_front(pkt_capture_p3.cap_out_data);
			port3_t1_cap[3].push_front(pkt_capture_p3.captime);
			end   
			else if (pkt_capture_p3.cap_tag == 2)
		    	begin
			port3_t2_cap[0].push_front(pkt_capture_p3.cap_tag);
			port3_t2_cap[1].push_front(pkt_capture_p3.cap_resp);
			port3_t2_cap[2].push_front(pkt_capture_p3.cap_out_data);
			port3_t2_cap[3].push_front(pkt_capture_p3.captime);
			end 
			else if (pkt_capture_p3.cap_tag == 3)
		    	begin
			port3_t3_cap[0].push_front(pkt_capture_p3.cap_tag);
			port3_t3_cap[1].push_front(pkt_capture_p3.cap_resp);
			port3_t3_cap[2].push_front(pkt_capture_p3.cap_out_data);
			port3_t3_cap[3].push_front(pkt_capture_p3.captime);
			end

		end

	$display("@%0t [SCOREBOARD] on port 3 run ended \n",$time); 
endtask


////////////////////////////////////////////////////////////////////////////////////////

task run_p4() ;
	$display("@%0t [SCOREBOARD] on port 4 run started \n",$time); 
		while(1) 
		begin
			
			mbx_ms_p4.get(pkt_capture_p4);
			total_pkts_recvd_p4++;
			$display("---------------------after get in scoreboard -- (port 4)----------------------\n");
			$display("from mon (captured data) tag = %0d, resp = %0d, data_out = %0d",pkt_capture_p4.cap_tag,pkt_capture_p4.cap_resp,pkt_capture_p4.cap_out_data);
			$display("-------------------------------------------------------\n");
			$display("@%0t [SCOREBOARD] on port 4 Packet %0d received \n",$time,total_pkts_recvd_p4); 
			
			if (pkt_capture_p4.cap_tag == 0)
			begin 
			port4_t0_cap[0].push_front(pkt_capture_p4.cap_tag); 
			port4_t0_cap[1].push_front(pkt_capture_p4.cap_resp);
			port4_t0_cap[2].push_front(pkt_capture_p4.cap_out_data);
			port4_t0_cap[3].push_front(pkt_capture_p4.captime);
			end
		    	else if (pkt_capture_p4.cap_tag == 1)
		    	begin
			port4_t1_cap[0].push_front(pkt_capture_p4.cap_tag);
			port4_t1_cap[1].push_front(pkt_capture_p4.cap_resp);
			port4_t1_cap[2].push_front(pkt_capture_p4.cap_out_data);
			port4_t1_cap[3].push_front(pkt_capture_p4.captime);
			end   
			else if (pkt_capture_p4.cap_tag == 2)
		    	begin
			port4_t2_cap[0].push_front(pkt_capture_p4.cap_tag);
			port4_t2_cap[1].push_front(pkt_capture_p4.cap_resp);
			port4_t2_cap[2].push_front(pkt_capture_p4.cap_out_data);
			port4_t2_cap[3].push_front(pkt_capture_p4.captime);
			end 
			else if (pkt_capture_p4.cap_tag == 3)
		    	begin
			port4_t3_cap[0].push_front(pkt_capture_p4.cap_tag);
			port4_t3_cap[1].push_front(pkt_capture_p4.cap_resp);
			port4_t3_cap[2].push_front(pkt_capture_p4.cap_out_data);
			port4_t3_cap[3].push_front(pkt_capture_p4.captime);
			end

		end

	$display("@%0t [SCOREBOARD] on port 4 run ended \n",$time); 
endtask

////////////////////////////////////////////////////////////////////////////////////////
task comp();
	comp_p1t0();
	comp_p1t1();
	comp_p1t2();
	comp_p1t3();

	comp_p2t0();
	comp_p2t1();
	comp_p2t2();
	comp_p2t3();

	comp_p3t0();
	comp_p3t1();
	comp_p3t2();
	comp_p3t3();

	comp_p4t0();
	comp_p4t1();
	comp_p4t2();
	comp_p4t3();
	
	missed();
	report();
endtask
///////////////////////////////////////////////////////////////////////////////////////
task comp_p1t0();

foreach(port1_t0_cap[2][data])
begin
	if(port1_t0_cap[2][data] == port1_t0_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port1_t0_exp[3][data],port1_t0_cap[3][data]);
	end
	else if (port1_t0_cap[2][data] == port1_t0_exp[2][data+1])
	begin
	$display("output on port 1 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port1_t0_exp[2][data],port1_t0_exp[3][data]); m1++;
	port1_t0_exp[0].delete(data);
	port1_t0_exp[1].delete(data);
	port1_t0_exp[2].delete(data);
	port1_t0_exp[3].delete(data);
	end
	else if (port1_t0_cap[2][data+1] == port1_t0_exp[2][data+1])
	begin
	$display("------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p1t0++;
	$display("index = %0d on port 1 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port1_t0_cap[2][data],port1_t0_exp[2][data],port1_t0_exp[3][data],port1_t0_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask

////////////////////////////////////////////////////////////////////////////////////////
task comp_p1t1();

foreach(port1_t1_cap[2][data])
begin
	if(port1_t1_cap[2][data] == port1_t1_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port1_t1_exp[3][data],port1_t1_cap[3][data]); 
	end
	else if (port1_t1_cap[2][data] == port1_t1_exp[2][data+1])
	begin
	$display("output on port 1 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port1_t1_exp[2][data],port1_t1_exp[3][data]); m2++;
	port1_t1_exp[0].delete(data);
	port1_t1_exp[1].delete(data);
	port1_t1_exp[2].delete(data);
	port1_t1_exp[3].delete(data);
	end
	else if (port1_t1_cap[2][data+1] == port1_t1_exp[2][data+1])
	begin
	$display("------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p1t1++;
	$display("index = %0d on port 1 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port1_t1_cap[2][data],port1_t1_exp[2][data],port1_t1_exp[3][data],port1_t1_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask

////////////////////////////////////////////////////////////////////////////////////////
task comp_p1t2();

foreach(port1_t2_cap[2][data])
begin
	if(port1_t2_cap[2][data] == port1_t2_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port1_t2_exp[3][data],port1_t2_cap[3][data]);
	end
	else if (port1_t2_cap[2][data] == port1_t2_exp[2][data+1])
	begin
	$display("output on port 1 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port1_t2_exp[2][data],port1_t2_exp[3][data]); m3++;
	port1_t2_exp[0].delete(data);
	port1_t2_exp[1].delete(data);
	port1_t2_exp[2].delete(data);
	port1_t2_exp[3].delete(data);
	end
	else if (port1_t2_cap[2][data+1] == port1_t2_exp[2][data+1])
	begin
	$display("-----------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p1t2++;
	$display("index = %0d on port 1 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port1_t2_cap[2][data],port1_t2_exp[2][data],port1_t2_exp[3][data],port1_t2_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask

////////////////////////////////////////////////////////////////////////////////////////
task comp_p1t3();

foreach(port1_t3_cap[2][data])
begin
	if(port1_t3_cap[2][data] == port1_t3_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port1_t3_exp[3][data],port1_t3_cap[3][data]);
	end
	else if (port1_t3_cap[2][data] == port1_t3_exp[2][data+1])
	begin
	$display("output on port 1 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port1_t3_exp[2][data],port1_t3_exp[3][data]); m4++;
	port1_t3_exp[0].delete(data);
	port1_t3_exp[1].delete(data);
	port1_t3_exp[2].delete(data);
	port1_t3_exp[3].delete(data);
	end
	else if (port1_t3_cap[2][data+1] == port1_t3_exp[2][data+1])
	begin
	$display("-------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p1t3++;
	$display("index = %0d on port 1 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port1_t3_cap[2][data],port1_t3_exp[2][data],port1_t3_exp[3][data],port1_t3_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask

////////////////////////////////////////////////////////////////////////////////////////
task comp_p2t0();

foreach(port2_t0_cap[2][data])
begin
	if(port2_t0_cap[2][data] == port2_t0_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port2_t0_exp[3][data],port2_t0_cap[3][data]);
	end
	else if (port2_t0_cap[2][data] == port2_t0_exp[2][data+1])
	begin
	$display("output on port 2 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port2_t0_exp[2][data],port2_t0_exp[3][data]); m5++;
	port2_t0_exp[0].delete(data);
	port2_t0_exp[1].delete(data);
	port2_t0_exp[2].delete(data);
	port2_t0_exp[3].delete(data);
	end
	else if (port2_t0_cap[2][data+1] == port2_t0_exp[2][data+1])
	begin
	$display("-------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p2t0++;
	$display("index = %0d on port 2 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port2_t0_cap[2][data],port2_t0_exp[2][data],port2_t0_exp[3][data],port2_t0_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask

////////////////////////////////////////////////////////////////////////////////////////
task comp_p2t1();

foreach(port2_t1_cap[2][data])
begin
	if(port2_t1_cap[2][data] == port2_t1_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port2_t1_exp[3][data],port2_t1_cap[3][data]);
	end
	else if (port2_t1_cap[2][data] == port2_t1_exp[2][data+1])
	begin
	$display("output on port 2 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port2_t1_exp[2][data],port2_t1_exp[3][data]); m6++;
	port2_t1_exp[0].delete(data);
	port2_t1_exp[1].delete(data);
	port2_t1_exp[2].delete(data);
	port2_t1_exp[3].delete(data);
	end
	else if (port2_t1_cap[2][data+1] == port2_t1_exp[2][data+1])
	begin
	$display("-------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p2t1++;
	$display("index = %0d on port 2 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port2_t1_cap[2][data],port2_t1_exp[2][data],port2_t1_exp[3][data],port2_t1_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask

////////////////////////////////////////////////////////////////////////////////////////
task comp_p2t2();

foreach(port2_t2_cap[2][data])
begin
	if(port2_t2_cap[2][data] == port2_t2_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port2_t2_exp[3][data],port2_t2_cap[3][data]);
	end
	else if (port2_t2_cap[2][data] == port2_t2_exp[2][data+1])
	begin
	$display("output on port 2 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port2_t2_exp[2][data],port2_t2_exp[3][data]); m7++;
	port2_t2_exp[0].delete(data);
	port2_t2_exp[1].delete(data);
	port2_t2_exp[2].delete(data);
	port2_t2_exp[3].delete(data);
	end
	else if (port2_t2_cap[2][data+1] == port2_t2_exp[2][data+1])
	begin
	$display("-------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p2t2++;
	$display("index = %0d on port 2 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port2_t2_cap[2][data],port2_t2_exp[2][data],port2_t2_exp[3][data],port2_t2_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask
///////////////////////////////////////////////////////////////////////////////////////

task comp_p2t3();

foreach(port2_t3_cap[2][data])
begin
	if(port2_t3_cap[2][data] == port2_t3_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port2_t3_exp[3][data],port2_t3_cap[3][data]);
	end
	else if (port2_t3_cap[2][data] == port2_t3_exp[2][data+1])
	begin
	$display("output on port 2 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port2_t3_exp[2][data],port2_t3_exp[3][data]); m8++;
	port2_t3_exp[0].delete(data);
	port2_t3_exp[1].delete(data);
	port2_t3_exp[2].delete(data);
	port2_t3_exp[3].delete(data);
	end
	else if (port2_t3_cap[2][data+1] == port2_t3_exp[2][data+1])
	begin
	$display("-------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p2t3++;
	$display("index = %0d on port 2 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port2_t3_cap[2][data],port2_t3_exp[2][data],port2_t3_exp[3][data],port2_t3_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask
///////////////////////////////////////////////////////////////////////////////////////

task comp_p3t0();

foreach(port3_t0_cap[2][data])
begin
	if(port3_t0_cap[2][data] == port3_t0_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port3_t0_exp[3][data],port3_t0_cap[3][data]);
	end
	else if (port3_t0_cap[2][data] == port3_t0_exp[2][data+1])
	begin
	$display("output on port 3 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port3_t0_exp[2][data],port3_t0_exp[3][data]); m9++;
	port3_t0_exp[0].delete(data);
	port3_t0_exp[1].delete(data);
	port3_t0_exp[2].delete(data);
	port3_t0_exp[3].delete(data);
	end
	else if (port3_t0_cap[2][data+1] == port3_t0_exp[2][data+1])
	begin
	$display("-------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p3t0++;
	$display("index = %0d on port 3 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port3_t0_cap[2][data],port3_t0_exp[2][data],port3_t0_exp[3][data],port3_t0_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask

////////////////////////////////////////////////////////////////////////////////////////
task comp_p3t1();

foreach(port3_t1_cap[2][data])
begin
	if(port3_t1_cap[2][data] == port3_t1_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port3_t1_exp[3][data],port3_t1_cap[3][data]);
	end
	else if (port3_t1_cap[2][data] == port3_t1_exp[2][data+1])
	begin
	$display("output on port 3 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port3_t1_exp[2][data],port3_t1_exp[3][data]); m10++;
	
	port3_t1_exp[0].delete(data);
	port3_t1_exp[1].delete(data);
	port3_t1_exp[2].delete(data);
	port3_t1_exp[3].delete(data);
	end
	else if (port3_t1_cap[2][data+1] == port3_t1_exp[2][data+1])
	begin
	$display("-------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p3t1++;
	$display("index = %0d on port 3 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port3_t1_cap[2][data],port3_t1_exp[2][data],port3_t1_exp[3][data],port3_t1_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask

////////////////////////////////////////////////////////////////////////////////////////
task comp_p3t2();

foreach(port3_t2_cap[2][data])
begin
	if(port3_t2_cap[2][data] == port3_t2_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port3_t2_exp[3][data],port3_t2_cap[3][data]);
	end
	else if (port3_t2_cap[2][data] == port3_t2_exp[2][data+1])
	begin
	$display("output on port 3 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port3_t2_exp[2][data],port3_t2_exp[3][data]); m11++;
	port3_t2_exp[0].delete(data);
	port3_t2_exp[1].delete(data);
	port3_t2_exp[2].delete(data);
	port3_t2_exp[3].delete(data);
	end
	else if (port3_t2_cap[2][data+1] == port3_t2_exp[2][data+1])
	begin
	$display("-------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p3t2++;
	$display("index = %0d on port 3 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port3_t2_cap[2][data],port3_t2_exp[2][data],port3_t2_exp[3][data],port3_t2_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask
///////////////////////////////////////////////////////////////////////////////////////

task comp_p3t3();

foreach(port3_t3_cap[2][data])
begin
	if(port3_t3_cap[2][data] == port3_t3_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port3_t3_exp[3][data],port3_t3_cap[3][data]);
	end
	else if (port3_t3_cap[2][data] == port3_t3_exp[2][data+1])
	begin
	$display("output on port 3 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port3_t3_exp[2][data],port3_t3_exp[3][data]); m12++;
	port3_t3_exp[0].delete(data);
	port3_t3_exp[1].delete(data);
	port3_t3_exp[2].delete(data);
	port3_t3_exp[3].delete(data);
	end
	else if (port3_t3_cap[2][data+1] == port3_t3_exp[2][data+1])
	begin
	$display("-------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p3t3++;
	$display("index = %0d on port 3 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port3_t3_cap[2][data],port3_t3_exp[2][data],port3_t3_exp[3][data],port3_t3_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask
///////////////////////////////////////////////////////////////////////////////////////


task comp_p4t0();

foreach(port4_t0_cap[2][data])
begin
	if(port4_t0_cap[2][data] == port4_t0_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port4_t0_exp[3][data],port4_t0_cap[3][data]);
	end
	else if (port4_t0_cap[2][data] == port4_t0_exp[2][data+1])
	begin
	$display("output on port 4 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port4_t0_exp[2][data],port4_t0_exp[3][data]); m13++;
	port4_t0_exp[0].delete(data);
	port4_t0_exp[1].delete(data);
	port4_t0_exp[2].delete(data);
	port4_t0_exp[3].delete(data);
	end
	else if (port4_t0_cap[2][data+1] == port4_t0_exp[2][data+1])
	begin
	$display("-------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p4t0++;
	$display("index = %0d on port 4 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port4_t0_cap[2][data],port4_t0_exp[2][data],port4_t0_exp[3][data],port4_t0_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask

////////////////////////////////////////////////////////////////////////////////////////

task comp_p4t1();

foreach(port4_t1_cap[2][data])
begin
	if(port4_t1_cap[2][data] == port4_t1_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port4_t1_exp[3][data],port4_t1_cap[3][data]);
	end
	else if (port4_t1_cap[2][data] == port4_t1_exp[2][data+1])
	begin
	$display("output on port 4 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port4_t1_exp[2][data],port4_t1_exp[3][data]); m14++;
	port4_t1_exp[0].delete(data);
	port4_t1_exp[1].delete(data);
	port4_t1_exp[2].delete(data);
	port4_t1_exp[3].delete(data);
	end
	else if (port4_t1_cap[2][data+1] == port4_t1_exp[2][data+1])
	begin
	$display("-------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p4t1++;
	$display("index = %0d on port 4 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port4_t1_cap[2][data],port4_t1_exp[2][data],port4_t1_exp[3][data],port4_t1_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask
///////////////////////////////////////////////////////////////////////////////////////

task comp_p4t2();

foreach(port4_t2_cap[2][data])
begin
	if(port4_t2_cap[2][data] == port4_t2_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port4_t2_exp[3][data],port4_t2_cap[3][data]);
	end
	else if (port4_t2_cap[2][data] == port4_t2_exp[2][data+1])
	begin
	$display("output on port 4 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port4_t2_exp[2][data],port4_t2_exp[3][data]); m15++;
	port4_t2_exp[0].delete(data);
	port4_t2_exp[1].delete(data);
	port4_t2_exp[2].delete(data);
	port4_t2_exp[3].delete(data);
	end
	else if (port4_t2_cap[2][data+1] == port4_t2_exp[2][data+1])
	begin
	$display("-------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p4t2++;
	$display("index = %0d on port 4 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port4_t2_cap[2][data],port4_t2_exp[2][data],port4_t2_exp[3][data],port4_t2_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask
///////////////////////////////////////////////////////////////////////////////////////

task comp_p4t3();

foreach(port4_t3_cap[2][data])
begin
	if(port4_t3_cap[2][data] == port4_t3_exp[2][data])
	begin
	$display("(match) packet sent in time = %0p, packet recieved time = %0p",port4_t3_exp[3][data],port4_t3_cap[3][data]);
	end
	else if (port4_t3_cap[2][data] == port4_t3_exp[2][data+1])
	begin
	$display("output on port 4 index = %0d expecting output = %0p, for input sent at time = %0p -------------------- -----------------------------MISSED",data,port4_t3_exp[2][data],port4_t3_exp[3][data]); m16++;
	port4_t3_exp[0].delete(data);
	port4_t3_exp[1].delete(data);
	port4_t3_exp[2].delete(data);
	port4_t3_exp[3].delete(data);
	end
	else if (port4_t3_cap[2][data+1] == port4_t3_exp[2][data+1])
	begin
	$display("-------------------------------------------------------------------------------------------------------------------------------------MISMATCH"); p4t3++;
	$display("index = %0d on port 4 mismatch captured data = %0p and expected data = %0p, packet sent in time = %0p, packet recieved time = %0p",data,port4_t3_cap[2][data],port4_t3_exp[2][data],port4_t3_exp[3][data],port4_t3_cap[3][data]);
	$display("----------------------------------------------------------------------------------------------------------------------------------------------");
	end
	
end
endtask
///////////////////////////////////////////////////////////////////////////////////////
task missed();
int missedtest;

int missed_p1 = m1+m2+m3+m4;
int missed_p2 = m5+m6+m7+m8;
int missed_p3 = m9+m10+m11+m12;
int missed_p4 = m13+m14+m15+m16;


missedtest = missed_p1+missed_p2+missed_p3+missed_p4;
if (missedtest > 0) this.error = 1;
$display();
$display("-----[SCOREBOARD]-------------------------------------------------------------------total number of unresponsive testcases  = %0d",missedtest);
endtask
//////////////////////////////////////////////////////////////////////////////////////

task run();
fork
frm_gen_p1();
frm_gen_p2();
frm_gen_p3();
frm_gen_p4();
run_p1();
run_p2();
run_p3();
run_p4();
join
endtask

function void report();
int mismatch_p1 = 0;
int mismatch_p2 = 0;
int mismatch_p3 = 0;
int mismatch_p4 = 0;

int mismatch = 0;

mismatch_p1 = p1t0+p1t1+p1t2+p1t3;
mismatch_p2 = p2t0+p2t1+p2t2+p2t3;
mismatch_p3 = p3t0+p3t1+p3t2+p3t3;
mismatch_p4 = p4t0+p4t1+p4t2+p4t3;

mismatch = mismatch_p1+mismatch_p2+mismatch_p3+mismatch_p4;
if (mismatch > 0) this.error = 1;
$display("-----[SCOREBOARD]-------------------------------------------------------------------total number of mismatches = %0d",mismatch);
$display();
endfunction



endclass

endpackage
