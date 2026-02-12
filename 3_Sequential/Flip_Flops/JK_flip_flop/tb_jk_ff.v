module tb_jk_ff;
reg clk,rst,j,k;
wire q,q_bar;
jk_ff uut(.clk(clk), .rst(rst), .j(j), .k(k), .q(q), .q_bar(q_bar));
always #5clk=~clk;
initial begin
clk=1; rst=1; j=0; k=0;
#10 rst=0; j=0; k=0;
#10 j=0; k=1;
#10 j=1; k=0;
#10 rst=1; j=1; k=0;
#10 rst=0; j=1; k=1;
#5 j=1; k=0;
#10 rst=0;
#10 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst=%b | j=%b | k=%b | q=%b | q_bar=%b",$time,clk,rst,j,k,q,q_bar);
$dumpfile("tb_jk_ff.vcd");
$dumpvars(0,tb_jk_ff);
end
endmodule
