module tb_d_ff;
reg clk,rst,d;
wire q,q_bar;
d_ff uut(.clk(clk), .rst(rst), .d(d), .q(q), .q_bar(q_bar));
always#5 clk=~clk;
initial begin
clk=0; rst=1; d=1;
#10 rst=0; d=1;
#10 d=0;
#10 d=1;
#10 rst=1; d=1;
#10 rst=0;
#10 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst=%b | d=%b | q=%b | q_bar=%b",$time,clk,rst,d,q,q_bar);
$dumpfile("tb_d_ff.vcd");
$dumpvars(0,tb_d_ff);
end
endmodule
