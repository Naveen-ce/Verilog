module tb_Full_adder;
reg a,b,cin;
wire sum,carry;
full_adder f1(.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));
initial begin
a=0; b=0; cin=0;
#10 a=0; b=0; cin=1;
#10 a=0; b=1; cin=0;
#10 a=0; b=1; cin=1;
#10 a=1; b=0; cin=0;
#10 a=1; b=0; cin=1;
#10 a=1; b=1; cin=0;
#10 a=1; b=1; cin=1;
#10 $finish;
end
initial begin
$monitor("Time=%0t | a=%0b | b=%0b | c=%0b |  sum=%0b | carry=%0b",$time,a,b,cin,sum,carry);
$dumpfile("tb_full_adder.vcd");
$dumpvars(0,tb_Full_adder);
end
endmodule
