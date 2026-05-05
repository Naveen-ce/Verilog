module tb_clk_divider_by_3;
reg clk,rst;
wire f_by_3;
clk_divider_by_3 uut(.clk(clk), .rst(rst), .f_by_3(f_by_3));
always #5 clk=~clk;
initial begin
clk=0; rst=1;
#5 rst=0;
#50 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst=%b | f_by_3=%b",$time,clk,rst,f_by_3);
$dumpfile("clk_divider_by_3_50%.vcd");
$dumpvars(0,tb_clk_divider_by_3);
end
endmodule


