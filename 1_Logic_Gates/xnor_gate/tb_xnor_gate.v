module tb_xnor_gate;
reg a,b;
wire y;
xnor_gate x1(.a(a), .b(b), .y(y));
initial begin
	a=0; b=0;
	#10 a=0; b=1;
	#10 a=1; b=0;
	#10 a=1; b=1; 
	#20 $finish;
end
initial begin
	$monitor("Time=%0t | a=%0b | b=%0b | y=%0b",$time,a,b,y);
	$dumpfile("tb_xnor.vcd");
	$dumpvars(0,tb_xnor_gate);
end
endmodule
