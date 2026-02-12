module tb_nand_gate;
reg a,b;
wire y;
nand_gate n1(.a(a), .b(b), .y(y));
initial begin
a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
#10 $finish;
end
initial begin
$monitor("Time=%0t | a=%0b | b=%0b | y=%0b",$time,a,b,y);
$dumpfile("tb_nand.vcd");
$dumpvars(0,tb_nand_gate);
end
endmodule
