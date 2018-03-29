
class monitor_out;

virtual calc2_intf.tb_mon_out vif;
mailbox #(packet) mbx_ms;//will be connected to input of scoreboard

string name;
bit [15:0] no_of_pkts_recvd;
packet   pkt_capture;



function new (input mailbox #(packet) mbx_in,
              input virtual memory_if.tb_mon_out vif_in,
	      input string name="oMonitor");
this.mbx_ms = mbx_in;
this.vif = vif_in;
this.name=name;
endfunction

task run();
$display("@%0t [%s] run started \n",$time,name); 
while(1) 
begin
@(vif.cb_mon_out.out_tag1 or vif.cb_mon_out.out_tag2 or vif.cb_mon_out.out_tag3 or vif.cb_mon_out.out_tag4);

pkt_capture = new;

if (vif.cb_mon_out.out_tag1 == 1)
begin
	pkt_capture.cap_out_data1  = vif.cb_mon_out.out_data1;
	pkt_capture.cap_tag1  = vif.cb_mon_out.out_tag1;
	pkt_capture.cap_resp1  = vif.cb_mon_out.out_resp1;
end

else if (vif.cb_mon_out.out_tag2 == 1)
begin
	pkt_capture.cap_out_data2  = vif.cb_mon_out.out_data2;
	pkt_capture.cap_tag2  = vif.cb_mon_out.out_tag2;
	pkt_capture.cap_resp2  = vif.cb_mon_out.out_resp2;
end

else if (vif.cb_mon_out.out_tag3 == 1)
begin
	pkt_capture.cap_out_data3  = vif.cb_mon_out.out_data3;
	pkt_capture.cap_tag3  = vif.cb_mon_out.out_tag3;
	pkt_capture.cap_resp3  = vif.cb_mon_out.out_resp3;
end

else if (vif.cb_mon_out.out_tag4 == 1)
begin
	pkt_capture.cap_out_data4  = vif.cb_mon_out.out_data4;
	pkt_capture.cap_tag4  = vif.cb_mon_out.out_tag4;
	pkt_capture.cap_resp4  = vif.cb_mon_out.out_resp4;
end


mbx_ms.put(pkt_capture);
no_of_pkts_recvd++;
pkt_capture.print_out();
$display("@%0t [%s] Sent packet %0d to scoreboard \n",$time,name,no_of_pkts_recvd); 
end

$display("@%0t [%s] run ended \n",$time,name);//monitor will never end 
endtask

function void report();
$display("@%0t [%s] Report: total_packets_received=%0d \n",$time,name,no_of_pkts_recvd); 
endfunction


endclass