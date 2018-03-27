
class monitor_out;

string name;
bit [15:0] no_of_pkts_recvd;
packet   pkt;
virtual calc2_intf.tb_mon_out vif;
mailbox #(packet) mbx;//will be connected to input of scoreboard

function new (input mailbox #(packet) mbx_in,
              input virtual memory_if.tb_mon_out vif_in,
	      input string name="oMonitor");
this.mbx = mbx_in;
this.vif = vif_in;
this.name=name;
endfunction

task run();
$display("@%0t [%s] run started \n",$time,name); 
while(1) 
begin
@(vif.cb_mon_out.out_data1 or vif.cb_mon_out.out_data1 or vif.cb_mon_out.out_data1 or vif.cb_mon_out.out_data1);

pkt=new;

pkt.data1  = vif.cb_mon_out.out_data1;
pkt.data2  = vif.cb_mon_out.out_data2;
pkt.data3  = vif.cb_mon_out.out_data3;
pkt.data4  = vif.cb_mon_out.out_data4;

pkt.tag1  = vif.cb_mon_out.out_tag1;
pkt.tag2  = vif.cb_mon_out.out_tag2;
pkt.tag3  = vif.cb_mon_out.out_tag3;
pkt.tag4  = vif.cb_mon_out.out_tag4;

pkt.resp1  = vif.cb_mon_out.out_resp1;
pkt.resp2  = vif.cb_mon_out.out_resp2;
pkt.resp3  = vif.cb_mon_out.out_resp3;
pkt.resp4  = vif.cb_mon_out.out_resp4;

mbx.put(pkt);
no_of_pkts_recvd++;
pkt.print();
$display("@%0t [%s] Sent packet %0d to scoreboard \n",$time,name,no_of_pkts_recvd); 
end

$display("@%0t [%s] run ended \n",$time,name);//monitor will never end 
endtask

function void report();
$display("@%0t [%s] Report: total_packets_received=%0d \n",$time,name,no_of_pkts_recvd); 
endfunction


endclass