

class scoreboard;

bit [15:0] total_pkts_recvd;

mailbox #(packet) mbx_gs; //will be connected to input monitor
mailbox #(packet) mbx_ms;//will be connected to output monitor

bit [15:0] m_matches;
bit [15:0] m_mismatches;

function new (input mailbox #(packet) mbx_in,
              input mailbox #(packet) mbx_out);

this.mbx_gs  = mbx_in;
this.mbx_ms = mbx_out;
endfunction

task run ;
$display("@%0t [SCOREBOARD] run started \n",$time); 
while(1) 
begin
mbx_gs.get(pkt);
mbx_ms.get(pkt_capture);
total_pkts_recvd++;
$display("@%0t [SCOREBOARD] Packet %0d received \n",$time,total_pkts_recvd); 
if (pkt_capture.cap_out_data1 == pkt.exp_out1 )
begin
    m_matches++;
$display("@%0t [SCOREBOARD] Packet %0d Matched \n",$time,total_pkts_recvd); 
end
    else
    begin
    m_mismatches++;
$display("@%0t Error [SCOREBOARD] Packet %0d Not_Matched \n",$time,total_pkts_recvd); 
$display("@%0t *** Expected addr=%0d data=%0d \n Received addr=%0d data=%0d ****",$time,ref_pkt.addr,ref_pkt.data,got_pkt.addr,got_pkt.data); 
end
    
end

$display("@%0t [SCOREBOARD] run ended \n",$time); 
endtask

function void report();
$display("@%0t [SCOREBOARD] Report: total_packets_received=%0d \n",$time,total_pkts_recvd); 
$display("@%0t [SCOREBOARD] Report: Matches=%0d Mis_Matches=%0d \n",$time,m_matches,m_mismatches); 
endfunction

endclass