module tb_jhonson_counter;
reg clk,rst;
wire [3:0]count;
jhonson_counter jc(.clk(clk), .rst(rst), .count(count));
always #5clk=~clk;
initial begin
clk=0; rst=1;
#5 rst=0; 
#30 $finish; 
end
initial begin
$monitor("Time=%0t | clk=%b | rst=%b | count=%b",$time,clk,rst,count);
$dumpfile("jhonson_counter.vcd");
$dumpvars(0,tb_jhonson_counter);
end
endmodule
