module tb_q25;
reg [3:0]a,b;
wire [4:0]diff;
function_sub uut(.a(a), .b(b), .diff(diff));
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
$monitor("Time=%0t | a=%b | b=%b | diff=%b",$time,a,b,diff);
$dumpfile("q25_function_sub.vcd");
$dumpvars(0,tb_q25);
end
endmodule
