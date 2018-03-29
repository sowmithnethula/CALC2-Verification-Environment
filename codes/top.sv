
`include "calc2_intf.sv"
`include "program.sv"
`include "calc2_top.sv"

module top;

bit c_clk;
always #10 c_clk++;

calc2_intf intf (c_clk);
calc2_top DUT ( .out_data1(calc2_intf.out_data1), .out_data2(calc2_intf.out_data2), .out_data3(calc2_intf.out_data3), .out_data4(calc2_intf.out_data4), 
				.out_resp1(calc2_intf.out_resp1), .out_resp2(calc2_intf.out_resp2), .out_resp3(calc2_intf.out_resp3), .out_resp4(calc2_intf.out_resp4), 
				.out_tag1(calc2_intf.out_tag1), .out_tag2(calc2_intf.out_tag2), .out_tag3(calc2_intf.out_tag3), .out_tag4(calc2_intf.out_tag4), 
				.scan_out(calc2_intf.scan_out), 
				.a_clk(calc2_intf.a_clk), .b_clk(calc2_intf.b_clk), .c_clk(c_clk), 
				.req1_cmd_in(calc2_intf.req1_cmd_in), .req1_data_in(calc2_intf.req1_data_in), .req1_tag_in(calc2_intf.req1_tag_in), 
				.req2_cmd_in(calc2_intf.req2_cmd_in), .req2_data_in(calc2_intf.req2_data_in), .req2_tag_in(calc2_intf.req2_tag_in), 
				.req3_cmd_in(calc2_intf.req3_cmd_in), .req3_data_in(calc2_intf.req3_data_in), .req3_tag_in(calc2_intf.req3_tag_in), 
				.req4_cmd_in(calc2_intf.req4_cmd_in), .req4_data_in(calc2_intf.req4_data_in), .req4_tag_in(calc2_intf.req4_tag_in), 
				.reset(calc2_intf.reset), .scan_in(calc2_intf.scan_in));


endmodule