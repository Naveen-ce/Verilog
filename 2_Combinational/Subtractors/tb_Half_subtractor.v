module tb_Half_subtractor;
reg a,b;
wire diff,borrow;
half_subtractor h1(.a(a), .b(b), .diff(diff), .borrow(borrow));
initial begin
a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
#10 $finish;
end
initial begin
$monitor("Time=%0t | a=%0b | b=%0b | diff=%0b | borrow=%0b",$time,a,b,diff,borrow);
$dumpfile("tb_half_subtractor.vcd");
$dumpvars(0,tb_Half_subtractor);
end
endmodule
