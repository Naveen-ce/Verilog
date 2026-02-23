module tb_function_apb;
reg [31:0]a,b;
wire [31:0]y;
function_apb uut(.a(a), .b(b), .y(y));
initial begin
a=4; b=5;
$finish;
end
initial begin
$monitor("Time=%0t | a=%0d  b=%0d | y=%0d",$time,a,b,y);
$dumpfile("function_apb.vcd");
$dumpvars(0,tb_function_apb);
end
endmodule
