module tb_up_down_counter;
reg clk,rst,updown;
wire [3:0]count;
up_down_counter u1(.clk(clk), .rst(rst), .updown(updown), .count(count));
always #5clk=~clk;
initial begin
clk=1; rst=1; updown=1;
#5 rst=0; updown=1;
#155 rst=1; updown=0;
#5 rst=0; updown=0;
#160  $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst=%b | updown=%b |  count=%b",$time,clk,rst,updown,count);
$dumpfile("up_down_counter.vcd");
$dumpvars(0,tb_up_down_counter);
end
endmodule
