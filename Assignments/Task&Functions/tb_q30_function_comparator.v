module tb_function_comparator;
parameter N=4;
reg [N-1:0]a,b;
wire y;
function_comparator #(.N(N)) uut (.a(a), .b(b), .y(y));
initial begin
a=4'b0000; b=4'b0000;
#10 a=4'b0010; b=4'b1001;
#10 a=4'b0011; b=4'b1010;
#10 a=4'b1010; b=4'b1010;
#10 a=4'b0110; b=4'b1111;
#10 a=4'b1110; b=4'b1011;
$finish;
end
initial begin
$monitor("Time=%0t | a=%b | b=%b | y=%b",$time,a,b,y);
$dumpfile("function_comparator.vcd");
$dumpvars(0,tb_function_comparator);
end
endmodule
