module tb_q21;
reg [7:0]a,b;
wire [8:0]sum;
function_sum uut(.a(a), .b(b), .sum(sum));
integer i,j;
initial begin
for(i=0;i<4;i=i+1)
begin
for(j=0;j<4;j=j+1)begin
a=i; 
b=j;
#10;
end
end
end
initial begin
$monitor("Time=%0t | a=%b | b=%b | sum=%b",$time,a,b,sum);
$dumpfile("q21_function_sum.vcd");
$dumpvars(0,tb_q21);
end
endmodule
