module tb_function_evenparity;
parameter N=4;
reg [N-1:0]a;
wire even_parity;
function_evenparity #(.N(N)) uut(.a(a), .even_parity(even_parity));
initial begin
repeat(10)begin
a=$urandom_range(0,15);
#10;
end
$finish;
end
initial begin 
$monitor("Time=%0t | a=%b | even_parity=%b",$time,a,even_parity);
$dumpfile("function_evenparity.vcd");
$dumpvars(0,tb_function_evenparity);
end
endmodule


