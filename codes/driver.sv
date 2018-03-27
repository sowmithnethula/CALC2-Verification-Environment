

class driver;

packet   pkt;
mailbox #(packet) mbx;
virtual calc2_intf.tb vif;
bit [15:0] no_of_pkts_recvd;

function new (input mailbox #(packet) mbx_in,
	      input virtual calc2_intf.tb vif_in);
this.mbx  = mbx_in;
this.vif  = vif_in;
endfunction

task run();

$display("@%0t [DRIVER] run started \n",$time); 

while(1) //driver runs forever 
begin
mbx.get(pkt);
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

task drive_port1();
@(vif.cb);
$display("@%0t [DRIVER] write operation started\n",$time); 
vif.cb.req1_cmd_in <= cmd1; //sending opcodes
vif.cb.req1_tag_in <= tag1; //sending tags
vif.cb.req1_data_in <= data1a; //sending data
@(negedge clk)
vif.cb.req1_cmd_in <= 0;
vif.cb.req1_data_in <= data1b;
@(vif.cb);
$display("@%0t [DRIVER] write operation ended \n",$time); 
endtask

task drive_port2();
@(vif.cb);
$display("@%0t [DRIVER] write operation started\n",$time); 
vif.cb.req2_cmd_in <= cmd2;
vif.cb.req2_tag_in <= tag2;
vif.cb.req2_data_in <= data2a;
@(negedge clk)
vif.cb.req2_cmd_in <= 0;
vif.cb.req2_data_in <= data2b;
@(vif.cb);
$display("@%0t [DRIVER] write operation ended \n",$time); 
endtask

task drive_port3();
@(vif.cb);
$display("@%0t [DRIVER] write operation started\n",$time); 
vif.cb.req3_cmd_in <= cmd3;
vif.cb.req3_tag_in <= tag3;
vif.cb.req3_data_in <= data3a;
@(negedge clk)
vif.cb.req3_cmd_in <= 0;
vif.cb.req3_data_in <= data3b;
@(vif.cb);
$display("@%0t [DRIVER] write operation ended \n",$time); 
endtask

task drive_port4();
@(vif.cb);
$display("@%0t [DRIVER] write operation started\n",$time); 
vif.cb.req4_cmd_in <= cmd4;
vif.cb.req4_tag_in <= tag4;
vif.cb.req4_data_in <= data4a;
@(negedge clk)
vif.cb.req4_cmd_in <= 0;
vif.cb.req4_data_in <= data4b;
@(vif.cb);
$display("@%0t [DRIVER] write operation ended \n",$time); 
endtask

function void report(input string str="Driver");
$display("@%0t [%s] Report: total_packets_driven=%0d \n",$time,str,no_of_pkts_recvd); 
endfunction

endclass