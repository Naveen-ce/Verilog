module tb_sr_ff;
reg clk,rst,s,r;
wire q,q_bar;
sr_ff uut(.clk(clk), .rst(rst), .s(s), .r(r), .q(q), .q_bar(q_bar));
always #5clk=~clk;
initial begin
clk=1; rst=0; s=1; r=0;
#10 rst=0; s=0; r=0;
#10 s=0; r=1;
#10 s=1; r=0;
#10 rst=1; s=1; r=0;
#10 rst=0; s=1; r=1;
#5 s=1; r=1;
#10 rst=1;
#10 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst=%b | s=%b | r=%b | q=%b | q_bar=%b",$time,clk,rst,s,r,q,q_bar);
$dumpfile("tb_sr_ff.vcd");
$dumpvars(0,tb_sr_ff);
end
endmodule
