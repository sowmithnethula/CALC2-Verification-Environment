`include "packet.sv"

class generator;

bit [15:0] no_of_pkts;
packet pkt; //for initialization, check inside repeat

mailbox #(packet) mbx_gd; //parameterized mailbox. data type: packet
mailbox #(packet) mbx_gs;

function new (mailbox #(packet) mbx_in1,mailbox #(packet) mbx_in2,bit [15:0] gen_pkts_no=1);
//passing the mailbox handle from env to share the packet between generator
//and driver (common mailbox)
this.no_of_pkts = gen_pkts_no;
this.mbx_gd = mbx_in1;
this.mbx_gs = mbx_in2;
endfunction

task run(); //create and randomize the #no_of_pkts of packets and put into mailbox

bit [15:0] pkt_count;
//packet ref_pkt;
//ref_pkt = new(); //creation of packet

$display("@%0t [GENERATOR] run started \n",$time); 

repeat(no_of_pkts) 
begin
pkt = new();
mbx_gd.put(pkt);
mbx_gs.put(pkt);
pkt_count++;
//$display("@%0t [GENERATOR] Sent packet %0d to driver \n",$time,pkt_count); 
end

$display("@%0t [GENERATOR] run ended size of mailbox=%0d \n",$time,mbx.num()); 

endtask

function void report(input string str="GENERATOR");
$display("@%0t [%s] Report: total_packets_generated=%0d \n",$time,str,no_of_pkts); 
endfunction

endclass


