onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /top/calc2_intf/c_clk
add wave -noupdate -radix unsigned /top/calc2_intf/reset
add wave -noupdate -expand -group port1_req -radix unsigned /top/calc2_intf/req1_tag_in
add wave -noupdate -expand -group port1_req -radix unsigned /top/calc2_intf/req1_cmd_in
add wave -noupdate -expand -group port1_req -radix decimal /top/calc2_intf/req1_data_in
add wave -noupdate -expand -group port1_out -radix unsigned /top/calc2_intf/out_resp1
add wave -noupdate -expand -group port1_out -radix unsigned /top/calc2_intf/out_tag1
add wave -noupdate -expand -group port1_out -radix decimal /top/calc2_intf/out_data1
add wave -noupdate -expand -group port2_req -radix unsigned /top/calc2_intf/req2_tag_in
add wave -noupdate -expand -group port2_req -radix unsigned /top/calc2_intf/req2_cmd_in
add wave -noupdate -expand -group port2_req -radix decimal /top/calc2_intf/req2_data_in
add wave -noupdate -expand -group port2_out -radix unsigned /top/calc2_intf/out_resp2
add wave -noupdate -expand -group port2_out -radix unsigned /top/calc2_intf/out_tag2
add wave -noupdate -expand -group port2_out -radix decimal /top/calc2_intf/out_data2
add wave -noupdate -expand -group port3_req -radix unsigned /top/calc2_intf/req3_tag_in
add wave -noupdate -expand -group port3_req -radix unsigned /top/calc2_intf/req3_cmd_in
add wave -noupdate -expand -group port3_req -radix decimal /top/calc2_intf/req3_data_in
add wave -noupdate -expand -group port3_out -radix unsigned /top/calc2_intf/out_resp3
add wave -noupdate -expand -group port3_out -radix unsigned /top/calc2_intf/out_tag3
add wave -noupdate -expand -group port3_out -radix decimal /top/calc2_intf/out_data3
add wave -noupdate -expand -group port4_req -radix unsigned /top/calc2_intf/req4_tag_in
add wave -noupdate -expand -group port4_req -radix unsigned /top/calc2_intf/req4_cmd_in
add wave -noupdate -expand -group port4_req -radix decimal /top/calc2_intf/req4_data_in
add wave -noupdate -expand -group port4_out -radix unsigned /top/calc2_intf/out_resp4
add wave -noupdate -expand -group port4_out -radix unsigned /top/calc2_intf/out_tag4
add wave -noupdate -expand -group port4_out -radix decimal /top/calc2_intf/out_data4
add wave -noupdate -radix unsigned /top/calc2_intf/scan_out
add wave -noupdate -radix unsigned /top/calc2_intf/a_clk
add wave -noupdate -radix unsigned /top/calc2_intf/b_clk
add wave -noupdate -radix unsigned /top/calc2_intf/scan_in
add wave -noupdate -group calc2_intf/cb/req -radix unsigned /top/calc2_intf/cb/req1_data_in
add wave -noupdate -group calc2_intf/cb/req -radix unsigned /top/calc2_intf/cb/req2_data_in
add wave -noupdate -group calc2_intf/cb/req -radix unsigned /top/calc2_intf/cb/req3_data_in
add wave -noupdate -group calc2_intf/cb/req -radix unsigned /top/calc2_intf/cb/req4_data_in
add wave -noupdate -group calc2_intf/cb/req -radix unsigned /top/calc2_intf/cb/req1_tag_in
add wave -noupdate -group calc2_intf/cb/req -radix unsigned /top/calc2_intf/cb/req2_tag_in
add wave -noupdate -group calc2_intf/cb/req -radix unsigned /top/calc2_intf/cb/req3_tag_in
add wave -noupdate -group calc2_intf/cb/req -radix unsigned /top/calc2_intf/cb/req4_tag_in
add wave -noupdate -group calc2_intf/cb/req -radix unsigned /top/calc2_intf/cb/req1_cmd_in
add wave -noupdate -group calc2_intf/cb/req -radix unsigned /top/calc2_intf/cb/req2_cmd_in
add wave -noupdate -group calc2_intf/cb/req -radix unsigned /top/calc2_intf/cb/req3_cmd_in
add wave -noupdate -group calc2_intf/cb/req -radix unsigned /top/calc2_intf/cb/req4_cmd_in
add wave -noupdate -radix unsigned /top/calc2_intf/cb/cb_event
add wave -noupdate -group calc2_intf/cb_mon_in -radix unsigned /top/calc2_intf/cb_mon_in/req1_data_in
add wave -noupdate -group calc2_intf/cb_mon_in -radix unsigned /top/calc2_intf/cb_mon_in/req2_data_in
add wave -noupdate -group calc2_intf/cb_mon_in -radix unsigned /top/calc2_intf/cb_mon_in/req3_data_in
add wave -noupdate -group calc2_intf/cb_mon_in -radix unsigned /top/calc2_intf/cb_mon_in/req4_data_in
add wave -noupdate -group calc2_intf/cb_mon_in -radix unsigned /top/calc2_intf/cb_mon_in/req1_tag_in
add wave -noupdate -group calc2_intf/cb_mon_in -radix unsigned /top/calc2_intf/cb_mon_in/req2_tag_in
add wave -noupdate -group calc2_intf/cb_mon_in -radix unsigned /top/calc2_intf/cb_mon_in/req3_tag_in
add wave -noupdate -group calc2_intf/cb_mon_in -radix unsigned /top/calc2_intf/cb_mon_in/req4_tag_in
add wave -noupdate -group calc2_intf/cb_mon_in -radix unsigned /top/calc2_intf/cb_mon_in/req1_cmd_in
add wave -noupdate -group calc2_intf/cb_mon_in -radix unsigned /top/calc2_intf/cb_mon_in/req2_cmd_in
add wave -noupdate -group calc2_intf/cb_mon_in -radix unsigned /top/calc2_intf/cb_mon_in/req3_cmd_in
add wave -noupdate -group calc2_intf/cb_mon_in -radix unsigned /top/calc2_intf/cb_mon_in/req4_cmd_in
add wave -noupdate -radix unsigned /top/calc2_intf/cb_mon_in/cb_mon_in_event
add wave -noupdate -group calc2_intf/cb_mon_out -radix unsigned /top/calc2_intf/cb_mon_out/out_resp1
add wave -noupdate -group calc2_intf/cb_mon_out -radix unsigned /top/calc2_intf/cb_mon_out/out_resp2
add wave -noupdate -group calc2_intf/cb_mon_out -radix unsigned /top/calc2_intf/cb_mon_out/out_resp3
add wave -noupdate -group calc2_intf/cb_mon_out -radix unsigned /top/calc2_intf/cb_mon_out/out_resp4
add wave -noupdate -group calc2_intf/cb_mon_out -radix unsigned /top/calc2_intf/cb_mon_out/out_tag1
add wave -noupdate -group calc2_intf/cb_mon_out -radix unsigned /top/calc2_intf/cb_mon_out/out_tag2
add wave -noupdate -group calc2_intf/cb_mon_out -radix unsigned /top/calc2_intf/cb_mon_out/out_tag3
add wave -noupdate -group calc2_intf/cb_mon_out -radix unsigned /top/calc2_intf/cb_mon_out/out_tag4
add wave -noupdate -group calc2_intf/cb_mon_out -radix unsigned /top/calc2_intf/cb_mon_out/out_data1
add wave -noupdate -group calc2_intf/cb_mon_out -radix unsigned /top/calc2_intf/cb_mon_out/out_data2
add wave -noupdate -group calc2_intf/cb_mon_out -radix unsigned /top/calc2_intf/cb_mon_out/out_data3
add wave -noupdate -group calc2_intf/cb_mon_out -radix unsigned /top/calc2_intf/cb_mon_out/out_data4
add wave -noupdate -radix unsigned /top/calc2_intf/cb_mon_out/cb_mon_out_event
add wave -noupdate -radix unsigned /top/test/vif/c_clk
add wave -noupdate -radix unsigned /top/test/vif/reset
add wave -noupdate -radix unsigned /top/test/vif/scan_out
add wave -noupdate -radix unsigned /top/test/vif/a_clk
add wave -noupdate -radix unsigned /top/test/vif/b_clk
add wave -noupdate -radix unsigned /top/test/vif/scan_in
add wave -noupdate -group vif/out -radix unsigned /top/test/vif/out_data1
add wave -noupdate -group vif/out -radix unsigned /top/test/vif/out_data2
add wave -noupdate -group vif/out -radix unsigned /top/test/vif/out_data3
add wave -noupdate -group vif/out -radix unsigned /top/test/vif/out_data4
add wave -noupdate -group vif/out -radix unsigned /top/test/vif/out_resp1
add wave -noupdate -group vif/out -radix unsigned /top/test/vif/out_resp2
add wave -noupdate -group vif/out -radix unsigned /top/test/vif/out_resp3
add wave -noupdate -group vif/out -radix unsigned /top/test/vif/out_resp4
add wave -noupdate -group vif/out -radix unsigned /top/test/vif/out_tag1
add wave -noupdate -group vif/out -radix unsigned /top/test/vif/out_tag2
add wave -noupdate -group vif/out -radix unsigned /top/test/vif/out_tag3
add wave -noupdate -group vif/out -radix unsigned /top/test/vif/out_tag4
add wave -noupdate -group vif/req -radix unsigned /top/test/vif/req1_cmd_in
add wave -noupdate -group vif/req -radix unsigned /top/test/vif/req2_cmd_in
add wave -noupdate -group vif/req -radix unsigned /top/test/vif/req3_cmd_in
add wave -noupdate -group vif/req -radix unsigned /top/test/vif/req4_cmd_in
add wave -noupdate -group vif/req -radix unsigned /top/test/vif/req1_tag_in
add wave -noupdate -group vif/req -radix unsigned /top/test/vif/req2_tag_in
add wave -noupdate -group vif/req -radix unsigned /top/test/vif/req3_tag_in
add wave -noupdate -group vif/req -radix unsigned /top/test/vif/req4_tag_in
add wave -noupdate -group vif/req -radix unsigned /top/test/vif/req1_data_in
add wave -noupdate -group vif/req -radix unsigned /top/test/vif/req2_data_in
add wave -noupdate -group vif/req -radix unsigned /top/test/vif/req3_data_in
add wave -noupdate -group vif/req -radix unsigned /top/test/vif/req4_data_in
add wave -noupdate -group vif/cb/req -radix unsigned /top/test/vif/cb/req1_data_in
add wave -noupdate -group vif/cb/req -radix unsigned /top/test/vif/cb/req2_data_in
add wave -noupdate -group vif/cb/req -radix unsigned /top/test/vif/cb/req3_data_in
add wave -noupdate -group vif/cb/req -radix unsigned /top/test/vif/cb/req4_data_in
add wave -noupdate -group vif/cb/req -radix unsigned /top/test/vif/cb/req1_tag_in
add wave -noupdate -group vif/cb/req -radix unsigned /top/test/vif/cb/req2_tag_in
add wave -noupdate -group vif/cb/req -radix unsigned /top/test/vif/cb/req3_tag_in
add wave -noupdate -group vif/cb/req -radix unsigned /top/test/vif/cb/req4_tag_in
add wave -noupdate -group vif/cb/req -radix unsigned /top/test/vif/cb/req1_cmd_in
add wave -noupdate -group vif/cb/req -radix unsigned /top/test/vif/cb/req2_cmd_in
add wave -noupdate -group vif/cb/req -radix unsigned /top/test/vif/cb/req3_cmd_in
add wave -noupdate -group vif/cb/req -radix unsigned /top/test/vif/cb/req4_cmd_in
add wave -noupdate -radix unsigned /top/test/vif/cb/cb_event
add wave -noupdate -group vif/cb_mon_in -radix unsigned /top/test/vif/cb_mon_in/req1_data_in
add wave -noupdate -group vif/cb_mon_in -radix unsigned /top/test/vif/cb_mon_in/req2_data_in
add wave -noupdate -group vif/cb_mon_in -radix unsigned /top/test/vif/cb_mon_in/req3_data_in
add wave -noupdate -group vif/cb_mon_in -radix unsigned /top/test/vif/cb_mon_in/req4_data_in
add wave -noupdate -group vif/cb_mon_in -radix unsigned /top/test/vif/cb_mon_in/req1_tag_in
add wave -noupdate -group vif/cb_mon_in -radix unsigned /top/test/vif/cb_mon_in/req2_tag_in
add wave -noupdate -group vif/cb_mon_in -radix unsigned /top/test/vif/cb_mon_in/req3_tag_in
add wave -noupdate -group vif/cb_mon_in -radix unsigned /top/test/vif/cb_mon_in/req4_tag_in
add wave -noupdate -group vif/cb_mon_in -radix unsigned /top/test/vif/cb_mon_in/req1_cmd_in
add wave -noupdate -group vif/cb_mon_in -radix unsigned /top/test/vif/cb_mon_in/req2_cmd_in
add wave -noupdate -group vif/cb_mon_in -radix unsigned /top/test/vif/cb_mon_in/req3_cmd_in
add wave -noupdate -group vif/cb_mon_in -radix unsigned /top/test/vif/cb_mon_in/req4_cmd_in
add wave -noupdate -radix unsigned /top/test/vif/cb_mon_in/cb_mon_in_event
add wave -noupdate -group vif/cb_mon_out -radix unsigned /top/test/vif/cb_mon_out/out_resp1
add wave -noupdate -group vif/cb_mon_out -radix unsigned /top/test/vif/cb_mon_out/out_resp2
add wave -noupdate -group vif/cb_mon_out -radix unsigned /top/test/vif/cb_mon_out/out_resp3
add wave -noupdate -group vif/cb_mon_out -radix unsigned /top/test/vif/cb_mon_out/out_resp4
add wave -noupdate -group vif/cb_mon_out -radix unsigned /top/test/vif/cb_mon_out/out_tag1
add wave -noupdate -group vif/cb_mon_out -radix unsigned /top/test/vif/cb_mon_out/out_tag2
add wave -noupdate -group vif/cb_mon_out -radix unsigned /top/test/vif/cb_mon_out/out_tag3
add wave -noupdate -group vif/cb_mon_out -radix unsigned /top/test/vif/cb_mon_out/out_tag4
add wave -noupdate -group vif/cb_mon_out -radix unsigned /top/test/vif/cb_mon_out/out_data1
add wave -noupdate -group vif/cb_mon_out -radix unsigned /top/test/vif/cb_mon_out/out_data2
add wave -noupdate -group vif/cb_mon_out -radix unsigned /top/test/vif/cb_mon_out/out_data3
add wave -noupdate -group vif/cb_mon_out -radix unsigned /top/test/vif/cb_mon_out/out_data4
add wave -noupdate -radix unsigned /top/test/vif/cb_mon_out/cb_mon_out_event
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {112 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 295
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {21305 ns}
