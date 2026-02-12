module tb_binary_to_gray;
reg [3:0]b;
wire [3:0]g;
binary_to_gray uut(.*);
initial begin
	b=4'b1010;
	#10 b=4'b1001;
	#10 b=4'b1110;
	#10 b=4'b0101;
	#10 $finish;
end
initial begin
$monitor("Time=%0t | b=%b | g=%b",$time,b,g);
$dumpfile("binary_to_gray.vcd");
$dumpvars(0,tb_binary_to_gray);
end
endmodule

