/*Written By: Sowmith Nethula*/


package pkt;

class packet;

rand bit [0:3] 	 cmd;
rand bit [0:1]   tag;
rand bit [0:31]  dataa;
rand bit [0:31]  datab;

bit [0:3]   icmd;
bit [0:1]   itag;
bit [0:31]  idataa;
bit [0:31]  idatab;
int itime;


bit [0:3]   prev_cmd;
bit [0:1]   prev_tag;
bit [0:31]  prev_dataa;
bit [0:31]  prev_datab;

bit [0:1] exp_resp;
bit [0:31] exp_out;
bit [0:1] exp_tag;

bit [0:1] cap_tag;
bit [0:1] cap_resp;
bit [0:31] cap_out_data;
int captime;

bit [0:35] exp_out_36bits;

constraint constr {	cmd inside {1,2,5,6};
					cmd != prev_cmd;
					tag != prev_tag;
					dataa != prev_dataa;
					datab != prev_datab;
					dataa < 32'b11111111_11111111_11111111_11111111;
					datab < 32'b11111111_11111111_11111111_11111111;
					
				}
				
function void post_randomize (); //copying current random values for constraints not to repeat the valuessim:/top/calc2_intf/out_data1

	prev_cmd = cmd;
	
	prev_dataa = dataa;
	
	prev_datab = datab;
	
	prev_tag = tag;

endfunction

function void exp_op_data();
	if (icmd == 1)
	begin
	exp_out = idataa + idatab;
	exp_out_36bits = idataa+idatab;
	end

	else if (icmd == 2)
	begin
	exp_out = idataa - idatab;
	end

	else if (icmd == 5)
	begin
	exp_out = idataa << idatab;
	end

	else if (icmd == 6)
	begin
	exp_out = idataa >> idatab;
	end
endfunction

function void exp_op_tag();
	exp_tag = itag;
endfunction

function void exp_op_resp();
	if (exp_out_36bits >= 32'b11111111_11111111_11111111_11111111)
	begin
	exp_resp = 2;
	end
	
	else if (icmd == 2)
	begin
		if (idataa < idatab)
		begin
		exp_resp = 2;
		end
		else
		begin
		exp_resp = 1;
		end
	end
	
	else
	begin
	exp_resp = 1;
	end
endfunction


function void print_in ();
$display("@%0t [Packet] req_cmd_in = %0d, req_tag_in = %0d, req_data_in (A) = %0d, req_data_in (B) = %0d",$time,cmd,tag,dataa,datab);
endfunction

function void print_in_cap ();
$display("@%0t [Packet] captured at monitor in:: req_cmd_in = %0d, req_tag_in = %0d, req_data_in (A) = %0d, req_data_in (B) = %0d",$time,icmd,itag,idataa,idatab);
endfunction

function void print_exp ();
$display("@%0t [Packet] exp_resp = %0d, exp_tag = %0d, exp_out = %0d",$time,exp_resp,exp_tag,exp_out);
endfunction

function void print_cap ();
$display("@%0t [Packet] cap_resp = %0d, cap_tag = %0d, cap_out_data = %0d",$time,cap_resp,cap_tag,cap_out_data);
endfunction

task exp_op_calculate();
	exp_op_data();
	exp_op_tag();
	exp_op_resp();
endtask

endclass
endpackage
