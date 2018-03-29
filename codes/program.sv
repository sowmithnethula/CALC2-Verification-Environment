
`include "test.sv"

program program_test (calc2_intf vif)

base_test test;

initial
begin

test = new (vif.tb,tb_mon_out);
test.run();
$display("@%0t [top] simulation finished \n",$time);
$finish;

end



endprogram