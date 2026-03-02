module tb_moore_fsm;
reg clk,rst,a;
wire q;
moore_fsm uut(.clk(clk), .rst(rst), .a(a), .q(q));
always #5 clk=~clk;
initial begin
	clk=0; rst=1; a=0;
	#5 rst=0;
	#10 a=1;
	#10 a=1;
	#10 a=0;
	#10 a=1;
	#10 a=1;
	#10 a=0;
	#10 a=1;
	#10 a=1;
	#10 a=0;
	#10 a=1;
	#20 $finish;
end
initial begin
	$monitor("Time=%0t | clk=%b | rst=%b | a=%b | q=%b",$time,clk,rst,a,q);
	$dumpfile("over_moore_fsm");
	$dumpvars(0,tb_moore_fsm);
end
endmodule


