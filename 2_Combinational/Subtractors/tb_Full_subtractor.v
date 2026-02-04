module tb_Full_subtractor;
reg a,b,bin;
wire diff,borrow;
full_subtractor f1(.a(a), .b(b), .bin(bin), .diff(diff), .borrow(borrow));
initial begin
a=0; b=0; bin=0;
#10 a=0; b=0; bin=1;
#10 a=0; b=1; bin=0;
#10 a=0; b=1; bin=1;
#10 a=1; b=0; bin=0;
#10 a=1; b=0; bin=1;
#10 a=1; b=1; bin=0;
#10 a=1; b=1; bin=1;
#10 $finish;
end
initial begin
$monitor("Time=%0t | a=%0b | b=%0b | c=%0b |  diff=%0b | borrow=%0b",$time,a,b,bin,diff,borrow);
$dumpfile("tb_full_subtractor.vcd");
$dumpvars(0,tb_Full_subtractor);
end
endmodule
