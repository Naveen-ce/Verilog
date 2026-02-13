module tb_up_counter;
reg clk,rst;
wire [3:0]count;
up_counter u1(.clk(clk), .rst(rst), .count(count));
always #5clk=~clk;
initial begin
clk=1; rst=1;
#10 rst=0;
#140 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst=%b | count=%b",$time,clk,rst,count);
$dumpfile("up_counter.vcd");
$dumpvars(0,tb_up_counter);
end
endmodule
