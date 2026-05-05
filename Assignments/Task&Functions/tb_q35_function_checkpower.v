module tb_function_checkpower;
reg [31:0]a;
wire y;
function_checkpower uut(.a(a), .y(y));
initial begin
a=2;
#10 a=10;
#10 a=128;
#10 a=101;
#10 a=256;
$finish;
end
initial begin
$monitor("Time=%0t | a=%0d | y=%0b",$time,a,y);
$dumpfile("function_checkpower.vcd");
$dumpvars(0,tb_function_checkpower);
end
endmodule
