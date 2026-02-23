module tb_function_square;
reg [31:0]a;
wire [31:0]out;
function_square uut(.a(a), .out(out));
integer i;
initial begin
for(i=0;i<6;i=i+1) begin
a=$urandom_range(20,2);
#10;
end
$finish;
end
initial begin
$monitor("Time=%0t | a=%0d | out=%0d",$time,a,out);
$dumpfile("q26_function_square.vcd");
$dumpvars(0,tb_function_square);
end
endmodule
