module  tb_ring_counter;
reg clk,rst,ori;
wire [3:0]count;
ring_counter rc(.clk(clk), .rst(rst), .ori(ori), .count(count));
always #5clk=~clk;
initial begin
clk=0; rst=0; ori=0;
#5 rst=1; ori=1;
#10 rst=0; ori=1;
#5 ori=0;
#60 $finish;
end
initial begin
$monitor("Time=%t | clk=%b | rst=%b | ori=%b | count=%b",$time,clk,rst,ori,count);
$dumpfile("ring_counter.vcd");
$dumpvars(0,tb_ring_counter);
end
endmodule
