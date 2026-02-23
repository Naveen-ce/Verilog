module tb_function_returnminimum;
parameter N=8;
reg [N-1:0]a,b;
wire [N-1:0]y;
function_returnminimum #(.N(N)) uut (.a(a), .b(b), .y(y));
initial begin
a=8'b00000001; b=8'b00000000;
#10 a=8'b00101111; b=8'b10010000;
#10 a=8'b00110000; b=8'b10101111;
#10 a=8'b10101010; b=8'b10100000;
#10 a=8'b01101001; b=8'b11111011;
#10 a=8'b11100100; b=8'b10110110;
$finish;
end
initial begin
$monitor("Time=%0t | a=%b | b=%b | y=%b",$time,a,b,y);
$dumpfile("function_returnminimum.vcd");
$dumpvars(0,tb_function_returnminimum);
end
endmodule
