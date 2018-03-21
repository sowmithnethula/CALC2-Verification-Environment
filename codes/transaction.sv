

class packet;

rand bit [0:3] 	 cmd1, cmd2, cmd3, cmd4;
rand bit [0:1] 	 tag1, tag2, tag3, tag4;
rand bit [0:31]  data1, data2, data3, data4;

bit [0:3] 	 prev_cmd1, prev_cmd2, prev_cmd3, prev_cmd4;
bit [0:1] 	 prev_tag1, prev_tag2, prev_tag3, prev_tag4;
bit [0:31]  prev_data1, prev_data2, prev_data3, prev_data4;

constraint port1 {	cmd1 inside {0,1,2,5,6};
					cmd1 != prev_cmd1;
					tag1 != prev_tag1;
					data1 != prev_data1;
				}

constraint port2 {	cmd2 inside {0,1,2,5,6};
					cmd2 != prev_cmd2;
					tag2 != prev_tag2;
					data2 != prev_data2;
				}

constraint port3 {	cmd3 inside {0,1,2,5,6};
					cmd3 != prev_cmd3;
					tag3 != prev_tag3;
					data3 != prev_data3;
				}
				
constraint port4 {	cmd4 inside {0,1,2,5,6};
					cmd4 != prev_cmd4;
					tag4 != prev_tag4;
					data4 != prev_data4;
				}
				
function void post_rand (); //copying current random values for constraints not to repeat the values
	prev_cmd1 = cmd1;
	prev_cmd2 = cmd2;
	prev_cmd3 = cmd3;
	prev_cmd4 = cmd4;
	
	prev_data1 = data1;
	prev_data1 = data1;
	prev_data1 = data1;
	prev_data1 = data1;
	
	prev_tag1 = tag1;
	prev_tag2 = tag2;
	prev_tag3 = tag3;
	prev_tag4 = tag4;
endfunction

endclass