module tb_not_gate;
reg a;
wire y;
not_gate n1(.a(a), .y(y));
initial begin
 a=0;
#20 a=1;
#30 $finish;
end
initial begin
$monitor("Time=%0t | a=%0b | y=%0b",$time,a,y);
$dumpfile("tb_not.vcd");
$dumpvars(0,tb_not_gate);
end
endmodule
