

class generator;

bit [15:0] no_of_pkts;
packet pkt;

mailbox #(packet) mbx; //parameterized mailbox. data type: packet

function new (mailbox #(packet) mbx_in,bit [15:0] gen_pkts_no=1);
this.no_of_pkts= gen_pkts_no;
this.mbx       = mbx_in;
endfunction



endclass


