module tb_t_ff;
reg clk,rst,t;
wire q,q_bar;
t_ff uut(.clk(clk), .rst(rst), .t(t), .q(q), .q_bar(q_bar));
always#5 clk=~clk;
initial begin
clk=0; rst=1; t=1;
#10 rst=0; t=1;
#10 t=0;
#10 t=1;
#10 rst=1; t=1;
#10 rst=0;
#10 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst=%b | t=%b | q=%b | q_bar=%b",$time,clk,rst,t,q,q_bar);
$dumpfile("tb_t_ff.vcd");
$dumpvars(0,tb_t_ff);
end
endmodule
