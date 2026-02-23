module tb_function_no_of_1;
parameter N=8;
reg [N-1:0]a;
wire [5:0]y;
function_no_of_1 #(.N(N)) uut(.a(a), .y(y));
initial begin
a=10110110;
#10 a=10110000;
#10 a=10111100;
#10 a=10110111;
$finish;
end
initial begin
$monitor("Time=%0t | a=%b | y=%d",$time,a,y);
$dumpfile("function_no_of_1.vcd");
$dumpvars(0,tb_function_no_of_1);
end
endmodule
