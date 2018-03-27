

class generator;

bit [15:0] no_of_pkts;
packet pkt;

mailbox #(packet) mbx; //parameterized mailbox. data type: packet

function new (mailbox #(packet) mbx_in,bit [15:0] gen_pkts_no=1);
this.no_of_pkts= gen_pkts_no;
this.mbx       = mbx_in;
endfunction

task run();

bit [15:0] pkt_count;
packet ref_pkt;
ref_pkt = new(); //creation of packet

$display("@%0t [GENERATOR] run started \n",$time); 

repeat(no_of_pkts) 
begin
pkt = new();
mbx.put(pkt);
pkt_count++;
//$display("@%0t [GENERATOR] Sent packet %0d to driver \n",$time,pkt_count); 
end

$display("@%0t [GENERATOR] run ended size of mailbox=%0d \n",$time,mbx.num()); 

endtask

function void report(input string str="GENERATOR");
$display("@%0t [%s] Report: total_packets_generated=%0d \n",$time,str,no_of_pkts); 
endfunction

endclass


