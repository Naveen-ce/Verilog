module tb_clk_divider_by_4;
reg clk,rst;
wire f_by_4;
clk_divider_by_4 uut(.clk(clk), .rst(rst), .f_by_4(f_by_4));
always #5 clk=~clk;
initial begin
clk=0; rst=1;
#5 rst=0;
#100 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst=%b | f_by_4=%b",$time,clk,rst,f_by_4);
$dumpfile("clk_divider_by_4_75%.vcd");
$dumpvars(0,tb_clk_divider_by_4);
end
endmodule


