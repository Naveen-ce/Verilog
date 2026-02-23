module tb_function_oddparity;
parameter N=4;
reg [N-1:0]a;
wire odd_parity;
function_oddparity #(.N(N)) uut(.a(a), .odd_parity(odd_parity));
initial begin
repeat(10)begin
a=$urandom_range(0,15);
#10;
end
$finish;
end
initial begin 
$monitor("Time=%0t | a=%b | odd_parity=%b",$time,a,odd_parity);
$dumpfile("function_oddparity.vcd");
$dumpvars(0,tb_function_oddparity);
end
endmodule


