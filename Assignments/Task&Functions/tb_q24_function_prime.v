module tb_function_prime;
parameter N=8;
reg [N-1:0]a;
wire out;
prime_no #(.N(N)) uut(.a(a), .out(out));
integer i;
initial begin
for(i=0;i<12;i=i+1) begin
a=$urandom_range(16,0);
#10;
end
$finish;
end
initial begin
$monitor("Time=%0t | a=%0d | out=%b",$time,a,out);
$dumpfile("function_prime.vcd");
$dumpvars(0,tb_function_prime);
end
endmodule
