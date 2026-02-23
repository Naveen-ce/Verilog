module tb_function_reversebit;
reg [31:0]a;
wire [31:0]y;
function_reversebit uut(.a(a), .y(y));
initial begin
repeat(10) begin
a=$urandom_range(35,0);
#10;
end
$finish;
end
initial begin
$monitor("Time=%0t | a=%0d | y=%0d",$time,a,y);
$dumpfile("function_reversebit.vcd");
$dumpvars(0,tb_function_reversebit);
end
endmodule

