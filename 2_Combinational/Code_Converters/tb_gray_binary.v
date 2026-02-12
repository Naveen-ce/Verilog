module tb_gray_binary;
reg [3:0]g;
wire [3:0]b;
gray_to_binary uut(.*);
initial begin
g=4'b1000;
#10 g=4'b1011;
#10 g=4'b0110;
#10 g=4'b1010;
#10 $finish;
end
initial begin
$monitor("Time=%0t | g=%b | b=%b",$time,g,b);
$dumpfile("gray_to_binary.vcd");
$dumpvars(0,tb_gray_binary);
end
endmodule
