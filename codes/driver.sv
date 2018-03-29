

class driver;

bit [15:0] no_of_pkts_recvd;
virtual calc2_intf.tb vif; //creating a virtual interface

mailbox #(packet) mbx_gd;


function new (input mailbox #(packet) mbx_in,
	      input virtual calc2_intf.tb vif_in);
this.mbx_gd  = mbx_in;
this.vif  = vif_in;
endfunction

task drive_port1();
@(vif.cb);
$display("@%0t [DRIVER] write to port 1 \n",$time); 
vif.cb.req1_cmd_in <= pkt.cmd1; //sending opcodes
vif.cb.req1_tag_in <= pkt.tag1; //sending tags
vif.cb.req1_data_in <= pkt.data1a; //sending data
@(negedge clk)
vif.cb.req1_cmd_in <= 0;
vif.cb.req1_tag_in <= 0;
vif.cb.req1_data_in <= pkt.data1b;
@(vif.cb);
endtask

task drive_port2();
@(vif.cb);
$display("@%0t [DRIVER] write to port 2 \n",$time); 
vif.cb.req2_cmd_in <= pkt.cmd2;
vif.cb.req2_tag_in <= pkt.tag2;
vif.cb.req2_data_in <= pkt.data2a;
@(negedge clk)
vif.cb.req2_cmd_in <= 0;
vif.cb.req2_tag_in <= 0;
vif.cb.req2_data_in <= pkt.data2b;
@(vif.cb);
endtask

task drive_port3();
@(vif.cb);
$display("@%0t [DRIVER] write to port 3 \n",$time); 
vif.cb.req3_cmd_in <= pkt.cmd3;
vif.cb.req3_tag_in <= pkt.tag3;
vif.cb.req3_data_in <= pkt.data3a;
@(negedge clk)
vif.cb.req3_cmd_in <= 0;
vif.cb.req3_tag_in <= 0;
vif.cb.req3_data_in <= pkt.data3b;
@(vif.cb);
endtask

task drive_port4();
@(vif.cb);
$display("@%0t [DRIVER] write to port 4 \n",$time); 
vif.cb.req4_cmd_in <= pkt.cmd4;
vif.cb.req4_tag_in <= pkt.tag4;
vif.cb.req4_data_in <= pkt.data4a;
@(negedge clk)
vif.cb.req4_cmd_in <= 0;
vif.cb.req4_tag_in <= 0;
vif.cb.req4_data_in <= pkt.data4b;
@(vif.cb);
endtask

task run();

$display("@%0t [DRIVER] run started \n",$time); 

while(1) //driver runs forever 
begin
mbx_gd.get(pkt);
no_of_pkts_recvd++;
$display("@%0t [DRIVER] Received packet %0d from generator\n",$time,no_of_pkts_recvd); 
fork
drive_port1();
drive_port2();
drive_port3();
drive_port4();
join  
end//end_of_while

$display("@%0t [DRIVER] run ended \n",$time); 
endtask



function void report(input string str="Driver");
$display("@%0t [%s] Report: total_packets_driven=%0d \n",$time,str,no_of_pkts_recvd); 
endfunction

endclass