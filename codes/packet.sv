

class packet;

rand bit [0:3] 	 cmd1, cmd2, cmd3, cmd4;
randc bit [0:1] 	 tag1, tag2, tag3, tag4;
rand bit [0:31]  data1a, data2a, data3a, data4a;
rand bit [0:31]  data1b, data2b, data3b, data4b;

bit [0:3] 	 prev_cmd1, prev_cmd2, prev_cmd3, prev_cmd4;
bit [0:1] 	 prev_tag1, prev_tag2, prev_tag3, prev_tag4;
bit [0:31]  prev_data1a, prev_data2a, prev_data3a, prev_data4a;
bit [0:31]  prev_data1b, prev_data2b, prev_data3b, prev_data4b;

bit [0:1] exp_resp1, exp_resp2, exp_resp3, exp_resp4;
bit [0:31] exp_out1, exp_out2, exp_out3, exp_out4;

bit [0:1] cap_tag1, cap_tag2, cap_tag3, cap_tag4;
bit [0:1] cap_resp1, cap_resp2, cap_resp3, cap_resp4;
bit [0:31] cap_out_data1, cap_out_data2, cap_out_data3, cap_out_data4;




constraint port1 {	cmd1 inside {1,2,5,6};
					cmd1 != prev_cmd1;
					tag1 != prev_tag1;
					data1a != prev_data1a;
					data1b != prev_data1b;
				}

constraint port2 {	cmd2 inside {1,2,5,6};
					cmd2 != prev_cmd2;
					tag2 != prev_tag2;
					data2a != prev_data2a;
					data2b != prev_data2b;
				}

constraint port3 {	cmd3 inside {1,2,5,6};
					cmd3 != prev_cmd3;
					tag3 != prev_tag3;
					data3a != prev_data3a;
					data3b != prev_data3b;
				}
				
constraint port4 {	cmd4 inside {1,2,5,6};
					cmd4 != prev_cmd4;
					tag4 != prev_tag4;
					data4a != prev_data4a;
					data4b != prev_data4b;
				}
				
function void post_randomize (); //copying current random values for constraints not to repeat the values
	prev_cmd1 = cmd1;
	prev_cmd2 = cmd2;
	prev_cmd3 = cmd3;
	prev_cmd4 = cmd4;
	
	prev_data1a = data1a;
	prev_data2a = data2a;
	prev_data3a = data3a;
	prev_data4a = data4a;
	
	prev_data1b = data1b;
	prev_data2b = data2b;
	prev_data3b = data3b;
	prev_data4b = data4b;
	
	prev_tag1 = tag1;
	prev_tag2 = tag2;
	prev_tag3 = tag3;
	prev_tag4 = tag4;
endfunction

function void exp_op_port1();
if (cmd1 == 1)
begin
exp_out1 = data1a + data1b;
end

else if (cmd1 == 2)
begin
exp_out1 = data1a - data1b;
end

else if (cmd1 == 5)
begin
exp_out1 = data1a << data1b;
end

else if (cmd1 == 6)
begin
exp_out1 = data1a >> data1b;
end
endfunction

function void exp_op_port2();
if (cmd2 == 1)
begin
exp_out2 = data2a + data2b;
end

else if (cmd2 == 2)
begin
exp_out2 = data2a - data2b;
end

else if (cmd2 == 5)
begin
exp_out2 = data2a << data2b;
end

else if (cmd2 == 6)
begin
exp_out2 = data2a >> data2b;
end
endfunction

function void exp_op_port3();
if (cmd3 == 1)
begin
exp_out3 = data3a + data3b;
end

else if (cmd3 == 2)
begin
exp_out3 = data3a - data3b;
end

else if (cmd3 == 5)
begin
exp_out3 = data3a << data3b;
end

else if (cmd3 == 6)
begin
exp_out3 = data3a >> data3b;
end
endfunction

function void exp_op_port4();
if (cmd4 == 1)
begin
exp_out4 = data4a + data4b;
end

else if (cmd4 == 2)
begin
exp_out4 = data4a - data4b;
end

else if (cmd4 == 5)
begin
exp_out4 = data4a << data4b;
end

else if (cmd4 == 6)
begin
exp_out4 = data4a >> data4b;
end
endfunction


function void print_in ();
$display("@%0t [Packet] req1_cmd_in = %0d, req1_tag_in = %0d, req1_data_in (A) = %0d, req1_data_in (B) = %0d",$time,cmd1,tag1,data1a,data1b);
$display("@%0t [Packet] req2_cmd_in = %0d, req2_tag_in = %0d, req2_data_in (A) = %0d, req2_data_in (B) = %0d",$time,cmd2,tag2,data2a,data2b);
$display("@%0t [Packet] req3_cmd_in = %0d, req3_tag_in = %0d, req3_data_in (A) = %0d, req3_data_in (B) = %0d",$time,cmd3,tag3,data3a,data3b);
$display("@%0t [Packet] req4_cmd_in = %0d, req4_tag_in = %0d, req4_data_in (A) = %0d, req4_data_in (B) = %0d",$time,cmd4,tag4,data4a,data4b);
endfunction

function void print_out ();
$display("@%0t [Packet] out_resp1 = %0d, out_tag1 = %0d, out_data1 = %0d",$time,cap_resp1,cap_tag1,cap_out_data1);
$display("@%0t [Packet] out_resp2 = %0d, out_tag2 = %0d, out_data2 = %0d",$time,cap_resp2,cap_tag2,cap_out_data2);
$display("@%0t [Packet] out_resp3 = %0d, out_tag3 = %0d, out_data3 = %0d",$time,cap_resp3,cap_tag3,cap_out_data3);
$display("@%0t [Packet] out_resp4 = %0d, out_tag4 = %0d, out_data4 = %0d",$time,cap_resp4,cap_tag4,cap_out_data4);
endfunction

endclass