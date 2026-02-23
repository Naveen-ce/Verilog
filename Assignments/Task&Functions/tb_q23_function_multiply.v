module tb_function_multiply;
parameter N=4;
reg [N-1:0]a,b;
wire [N+3:0] out;
function_multiply #(.N(N)) uut(.a(a), .b(b), .out(out));
initial begin
a=4'b0010; b=4'b1010;
#10 a=4'b0110; b=4'b1011;
#10 a=4'b1001; b=4'b1110;
#10 a=4'b1111; b=4'b0101;
#10 a=4'b1101; b=4'b1001;
#10 $finish;
end

initial begin
$monitor("Time=%0t | a=%b | b=%b | out=%b",$time,a,b,out);
$dumpfile("function_multiply");
$dumpvars(0,tb_function_multiply);
end
endmodule

