module tb_clk_divider_by_6;
reg clk,rst;
wire f_by_6;
clk_divider_by_6 uut(.clk(clk), .rst(rst), .f_by_6(f_by_6));
always #5 clk=~clk;
initial begin
clk=0; rst=1;
#5 rst=0;
#100 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst=%b | f_by_6=%b",$time,clk,rst,f_by_6);
$dumpfile("clk_divider_by_6_50%.vcd");
$dumpvars(0,tb_clk_divider_by_6);
end
endmodule


