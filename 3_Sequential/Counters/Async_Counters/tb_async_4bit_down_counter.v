module tb_async_down_counter;
reg clk,rst;
wire [3:0]count;
async_down_counter uut(.clk(clk), .rst(rst), .count(count));
always #5clk=~clk;
initial begin
clk=0; rst=0;
#10 rst=1;
#5 rst=0;
#50 rst=1;
#5 rst=0;
#100 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst=%b | count=%b",$time,clk,rst,count);
$dumpfile("async_4bit_down_counter.vcd");
$dumpvars(0,tb_async_down_counter);
end
endmodule

