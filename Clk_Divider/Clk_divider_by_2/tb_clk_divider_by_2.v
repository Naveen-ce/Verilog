module tb_clk_divider_by_2;
reg clk,rst;
wire f_by_2;
clk_divider_by_2 uut(.clk(clk), .rst(rst), .f_by_2(f_by_2));
always #5 clk=~clk;
initial begin
clk=0; rst=1;
#10 rst=0;
#50 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst=%b | f_by_2=%b",$time,clk,rst,f_by_2);
$dumpfile("clk_divider_by_2_50%.vcd");
$dumpvars(0,tb_clk_divider_by_2);
end
endmodule


