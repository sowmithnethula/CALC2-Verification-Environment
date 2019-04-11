/*Written By: Sowmith Nethula*/


program program_test (calc2_intf vif);

`include "env/test.sv"

basetest test;

initial
begin


test = new (vif.tb, vif.tb_mon_out, vif.tb_mon_in);
test.run();
$display("@%0t [top] simulation finished \n",$time);
$stop;

end



endprogram
