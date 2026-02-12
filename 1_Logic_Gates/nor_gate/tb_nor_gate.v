module tb_nor_gate;
reg a,b;
wire y;
nor_gate n1(.a(a), .b(b), .y(y));
initial begin
a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
#20 $finish;
end
initial begin
$monitor("Time=%0t | a=%0b | b=%0b | y=%0b",$time,a,b,y);
$dumpfile("tb_nor.vcd");
$dumpvars(0,tb_nor_gate);
end
endmodule 
