module tb_function_btog;
reg [3:0]b;
wire [3:0]g;
function_btog uut(.b(b), .g(g));
initial begin
repeat(10)begin
b=$urandom_range(15,0);
#10;
end
$finish;
end
initial begin
$monitor("Time=%0t | b=%b | g=%b",$time,b,g);
$dumpfile("function_btog.vcd");
$dumpvars(0,tb_function_btog);
end
endmodule
