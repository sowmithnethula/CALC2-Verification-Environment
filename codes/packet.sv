

class packet;

rand bit [0:3] 	 cmd1, cmd2, cmd3, cmd4;
randc bit [0:1] 	 tag1, tag2, tag3, tag4;
rand bit [0:31]  data1a, data2a, data3a, data4a;
rand bit [0:31]  data1b, data2b, data3b, data4b;

bit [0:3] 	 prev_cmd1, prev_cmd2, prev_cmd3, prev_cmd4;
bit [0:1] 	 prev_tag1, prev_tag2, prev_tag3, prev_tag4;
bit [0:31]  prev_data1a, prev_data2a, prev_data3a, prev_data4a;
bit [0:31]  prev_data1b, prev_data2b, prev_data3b, prev_data4b;

bit [0:1] resp1, resp2, resp3, resp4;




constraint port1 {	cmd1 inside {0,1,2,5,6};
					cmd1 != prev_cmd1;
					tag1 != prev_tag1;
					data1a != prev_data1a;
					data1b != prev_data1b;
				}

constraint port2 {	cmd2 inside {0,1,2,5,6};
					cmd2 != prev_cmd2;
					tag2 != prev_tag2;
					data2a != prev_data2a;
					data2b != prev_data2b;
				}

constraint port3 {	cmd3 inside {0,1,2,5,6};
					cmd3 != prev_cmd3;
					tag3 != prev_tag3;
					data3a != prev_data3a;
					data3b != prev_data3b;
				}
				
constraint port4 {	cmd4 inside {0,1,2,5,6};
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

function void expected_op();


endfunction

function void print ();
$display("@%0t [Packet] req1_cmd_in = %0d, req1_tag_in = %0d, req1_data_in (A) = %0d, req1_data_in (B) = %0d",$time,cmd1,tag1,data1a,data1b);
$display("@%0t [Packet] req2_cmd_in = %0d, req2_tag_in = %0d, req2_data_in (A) = %0d, req2_data_in (B) = %0d",$time,cmd2,tag2,data2a,data2b);
$display("@%0t [Packet] req3_cmd_in = %0d, req3_tag_in = %0d, req3_data_in (A) = %0d, req3_data_in (B) = %0d",$time,cmd3,tag3,data3a,data3b);
$display("@%0t [Packet] req4_cmd_in = %0d, req4_tag_in = %0d, req4_data_in (A) = %0d, req4_data_in (B) = %0d",$time,cmd4,tag4,data4a,data4b);
endfunction

endclass