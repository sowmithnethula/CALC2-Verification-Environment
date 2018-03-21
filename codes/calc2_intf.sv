
// Sowmith Nethula



interface calc2_intf (input c_clk);

logic [0:31] out_data1, out_data2, out_data3, out_data4;
logic [0:1]  out_resp1, out_resp2, out_resp3, out_resp4, out_tag1, out_tag2, out_tag3, out_tag4;
logic scan_out;

logic a_clk, b_clk, reset, scan_in;
logic [0:3] req1_cmd_in, req2_cmd_in, req3_cmd_in, req4_cmd_in;
logic [0:1] req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in;
logic [0:31] req1_data_in, req2_data_in, req3_data_in, req4_data_in;


clocking cb @(posedge c_clk)  
output req1_cmd_in, req2_cmd_in, req3_cmd_in, req4_cmd_in;
output req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in;
output req1_data_in, req2_data_in, req3_data_in, req4_data_in;
endclocking

clocking cb_mon_in @(posedge c_clk)
input req1_cmd_in, req2_cmd_in, req3_cmd_in, req4_cmd_in;
input req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in;
input req1_data_in, req2_data_in, req3_data_in, req4_data_in;
endclocking

clocking cb_mon_out @(posedge c_clk)
input out_data1, out_data2, out_data3, out_data4;
input out_resp1, out_resp2, out_resp3, out_resp4, out_tag1, out_tag2, out_tag3, out_tag4;
endclocking


modport tb (clocking cb, output reset);
modport tb_mon_in (clocking cd_mon_in);
modport tb_mon_out (clocking cd_mon_out);

endinterface