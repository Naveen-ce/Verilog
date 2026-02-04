module tb_Half_adder;
reg a,b;
wire sum,carry;
half_adder h1(.a(a), .b(b), .sum(sum), .carry(carry));
initial begin
a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
#10 $finish;
end
initial begin
$monitor("Time=%0t | a=%0b | b=%0b | sum=%0b | carry=%0b",$time,a,b,sum,carry);
$dumpfile("tb_half_adder.vcd");
$dumpvars(0,tb_Half_adder);
end
endmodule
