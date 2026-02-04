module tb_and_gate;
reg a,b;
wire y;
and_gate a1(.a(a), .b(b), .y(y));
initial begin
a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
#10 $finish;
end
initial begin
$monitor("Time=%0t | a=%0b | b=%0b | Out=%0b",$time,a,b,y);
$dumpfile("tb_and.vcd");
$dumpvars(0,tb_and_gate);
end
endmodule
