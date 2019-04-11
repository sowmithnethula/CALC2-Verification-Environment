/*Written By: Sowmith Nethula*/


package gen;


import pkt::*;

class generator;

bit [15:0] no_of_pkts;

packet pkt_p1; //for initialization, check inside repeat
packet pkt_p2;
packet pkt_p3;
packet pkt_p4;


mailbox #(packet) mbx_gd_p1; //parameterized mailbox. data type: packet
mailbox #(packet) mbx_gd_p2;
mailbox #(packet) mbx_gd_p3;
mailbox #(packet) mbx_gd_p4;


function new (mailbox #(packet) mbx_gd_p1,
		mailbox #(packet) mbx_gd_p2,
		mailbox #(packet) mbx_gd_p3,
		mailbox #(packet) mbx_gd_p4, bit [15:0] gen_pkts_no=1);
		
//passing the mailbox handle from env to share the packet between generator
//and driver (common mailbox)

this.no_of_pkts = gen_pkts_no;
this.mbx_gd_p1 = mbx_gd_p1;
this.mbx_gd_p2 = mbx_gd_p2;
this.mbx_gd_p3 = mbx_gd_p3;
this.mbx_gd_p4 = mbx_gd_p4;

endfunction



task run_p1(); //create and randomize the #no_of_pkts of packets and put into mailbox
bit [15:0] pkt_count_p1;
$display("@%0t [GENERATOR] port 1 run started \n",$time); 
repeat(no_of_pkts) 
begin
static bit [0:1] p1;
pkt_p1 = new();
pkt_p1.post_randomize();
pkt_p1.randomize();
pkt_p1.tag = p1;
mbx_gd_p1.put(pkt_p1);
p1++;
pkt_count_p1++;
$display("@%0t [GENERATOR] (port 1) Sent packet %0d to driver \n",$time,pkt_count_p1); 
end
$display("@%0t [GENERATOR] run ended size of mailbox generator to driver (port 1) = %0d \n",$time,mbx_gd_p1.num()); 
endtask

task run_p2(); //create and randomize the #no_of_pkts of packets and put into mailbox
bit [15:0] pkt_count_p2;
$display("@%0t [GENERATOR] port 2 run started \n",$time); 
repeat(no_of_pkts) 
begin
static bit [0:1] p2;
pkt_p2 = new();
pkt_p2.post_randomize();
pkt_p2.randomize();
pkt_p2.tag = p2;
mbx_gd_p2.put(pkt_p2);
p2++;
pkt_count_p2++;
$display("@%0t [GENERATOR] (port 2) Sent packet %0d to driver \n",$time,pkt_count_p2); 
end
$display("@%0t [GENERATOR] run ended size of mailbox generator to driver (port 2) = %0d \n",$time,mbx_gd_p2.num()); 
endtask


task run_p3(); //create and randomize the #no_of_pkts of packets and put into mailbox
bit [15:0] pkt_count_p3;
$display("@%0t [GENERATOR] port 3 run started \n",$time); 
repeat(no_of_pkts) 
begin
static bit [0:1] p3;
pkt_p3 = new();
pkt_p3.post_randomize();
pkt_p3.randomize();
pkt_p3.tag = p3;
mbx_gd_p3.put(pkt_p3);
p3++;
pkt_count_p3++;
$display("@%0t [GENERATOR] (port 3) Sent packet %0d to driver \n",$time,pkt_count_p3); 
end
$display("@%0t [GENERATOR] run ended size of mailbox generator to driver (port 3) = %0d \n",$time,mbx_gd_p3.num()); 
endtask


task run_p4(); //create and randomize the #no_of_pkts of packets and put into mailbox
bit [15:0] pkt_count_p4;
$display("@%0t [GENERATOR] port 4 run started \n",$time); 
repeat(no_of_pkts) 
begin
static bit [0:1] p4;
pkt_p4 = new();
pkt_p4.post_randomize();
pkt_p4.randomize();
pkt_p4.tag = p4;
mbx_gd_p4.put(pkt_p4);
p4++;
pkt_count_p4++;
$display("@%0t [GENERATOR] (port 4) Sent packet %0d to driver \n",$time,pkt_count_p4); 
end
$display("@%0t [GENERATOR] run ended size of mailbox generator to driver (port 4) = %0d \n",$time,mbx_gd_p4.num()); 
endtask

task direct(input bit [0:3] opcode, input bit [0:1]dtag, input bit [31:0]data1,input bit [31:0]data2, [0:1]port);
packet directpkt;
	if (port == 1)
	begin
		directpkt = new();
		directpkt.cmd = opcode;
		directpkt.tag = dtag;
		directpkt.dataa = data1;
		directpkt.datab = data2;
		mbx_gd_p1.put(directpkt);
		
	end
	else if (port == 2)
	begin
		directpkt = new();
		directpkt.cmd = opcode;
		directpkt.tag = dtag;
		directpkt.dataa = data1;
		directpkt.datab = data2;
		mbx_gd_p2.put(directpkt);
		
	end
	else if (port == 3)
	begin
		directpkt = new();
		directpkt.cmd = opcode;
		directpkt.tag = dtag;
		directpkt.dataa = data1;
		directpkt.datab = data2;
		mbx_gd_p3.put(directpkt);
		
	end
	else if (port == 4)
	begin
		directpkt = new();
		directpkt.cmd = opcode;
		directpkt.tag = dtag;
		directpkt.dataa = data1;
		directpkt.datab = data2;
		mbx_gd_p4.put(directpkt);
		
	end

endtask

/////////--------------------------------------direct testcases

task add_direct();
bit [0:1] dt;
bit [31:0] a = 32'b00000000_00000000_00000000_00000001;
bit [31:0] b = 32'b00000000_00000000_00000000_00000001;
bit [31:0] a_max = 32'b11111111_11111111_11111111_11111111;
bit [31:0] b_max = 32'b11111111_11111111_11111111_11111111;

repeat (32)
begin
	direct(1,dt,a,b,1);
	direct(1,dt,a,b,2);
	direct(1,dt,a,b,3);
	direct(1,dt,a,b,4);
	dt++;
	a = a<<1;
end
endtask

task sub_direct();
bit [0:1] dt;
bit [31:0] a = 32'b00000000_00000000_00000000_00000001;
bit [31:0] b = 32'b00000000_00000000_00000000_00000001;
bit [31:0] a_max = 32'b11111111_11111111_11111111_11111111;
bit [31:0] b_max = 32'b11111111_11111111_11111111_11111111;

repeat (32)
begin
	direct(2,dt,a_max,b,1);
	direct(2,dt,a_max,b,2);
	direct(2,dt,a_max,b,3);
	direct(2,dt,a_max,b,4);
	dt++;
	b = b<<1;
end
endtask

task sl_direct();
bit [0:1] dt;
bit [31:0] a = 32'b00000000_00000000_00000000_00000001;
bit [31:0] b = 32'b00000000_00000000_00000000_00000001;
bit [31:0] a_max = 32'b11111111_11111111_11111111_11111111;
bit [31:0] b_max = 32'b11111111_11111111_11111111_11111111;

repeat (32)
begin
	direct(5,dt,a,b,1);
	direct(5,dt,a,b,2);
	direct(5,dt,a,b,3);
	direct(5,dt,a,b,4);
	dt++;
	b = b+1;
end
endtask

task sr_direct();
bit [0:1] dt;
bit [31:0] a = 32'b00000000_00000000_00000000_00000001;
bit [31:0] b = 32'b00000000_00000000_00000000_00000001;
bit [31:0] a_max = 32'b11111111_11111111_11111111_11111111;
bit [31:0] b_max = 32'b11111111_11111111_11111111_11111111;

repeat (32)
begin
	direct(6,dt,a,b,1);
	direct(6,dt,a,b,2);
	direct(6,dt,a,b,3);
	direct(6,dt,a,b,4);
	dt++;
	b = b+1;
end
endtask

task corner_direct();
bit [0:1] dt;
bit [31:0] a = 32'b00000000_00000000_00000000_00000001;
bit [31:0] b = 32'b00000000_00000000_00000000_00000001;
bit [31:0] a_max = 32'b11111111_11111111_11111111_11111111;
bit [31:0] b_max = 32'b11111111_11111111_11111111_11111111;


	direct(1,dt,a_max,b_max,1);
	direct(1,dt,a_max,0,1);
	direct(1,dt,0,b_max,1);
	direct(1,dt,0,0,1);
	
	direct(2,dt,a_max,b_max,2);
	direct(2,dt,a_max,0,3);
	direct(2,dt,0,b_max,4);
	direct(2,dt,0,0,1);


endtask

function void report(input string str="GENERATOR");
$display("@%0t [%s] Report: total_packets_generated=%0d \n",$time,str,no_of_pkts*4); 
endfunction

endclass

endpackage
