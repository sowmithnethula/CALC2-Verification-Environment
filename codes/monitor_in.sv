

class monitor_in ;

string name;
bit [15:0] no_of_pkts_recvd;
packet   pkt;
virtual calc2_intf.tb_mon_in vif;
mailbox #(packet) mbx;//will be connected to input of scoreboard


function new (input mailbox #(packet) mbx_in,
              input virtual calc2_intf.tb_mon_in vif_in,
			  input string name="iMonitor");
this.mbx = mbx_in;
this.vif = vif_in;
this.name=name;
endfunction

task run();
$display("@%0t [%s] run started \n",$time,name); 
while(1) 
begin
@(vif.cb_mon_in.req1_tag_in or vif.cb_mon_in.req2_tag_in or vif.cb_mon_in.req3_tag_in or vif.cb_mon_in.req4_tag_in);
pkt=new;

pkt.cmd1  = vif.cb_mon_in.req1_cmd_in;
pkt.cmd2  = vif.cb_mon_in.req1_cmd_in;
pkt.cmd3  = vif.cb_mon_in.req1_cmd_in;
pkt.cmd4  = vif.cb_mon_in.req1_cmd_in;

pkt.tag1  = vif.cb_mon_in.req1_tag_in;
pkt.tag2  = vif.cb_mon_in.req2_tag_in;
pkt.tag3  = vif.cb_mon_in.req3_tag_in;
pkt.tag4  = vif.cb_mon_in.req4_tag_in;

pkt.data1a  = vif.cb_mon_in.req1_data_in;
pkt.data2a  = vif.cb_mon_in.req2_data_in;
pkt.data3a  = vif.cb_mon_in.req3_data_in;
pkt.data4a  = vif.cb_mon_in.req4_data_in;


pkt.data1b  = vif.cb_mon_in.req1_data_in;
pkt.data2b  = vif.cb_mon_in.req2_data_in;
pkt.data3b  = vif.cb_mon_in.req3_data_in;
pkt.data4b  = vif.cb_mon_in.req4_data_in;

mbx.put(pkt);
no_of_pkts_recvd++;
pkt.print();
$display("@%0t [%s] Sent packet %0d to scoreboard \n",$time,name,no_of_pkts_recvd); 
end

$display("@%0t [%s] run ended \n",$time,name); //monitor will never end 
endtask

function void report();
$display("@%0t [%s] Report: total_packets_received=%0d \n",$time,name,no_of_pkts_recvd); 
endfunction



endclass