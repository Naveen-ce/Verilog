module tb_universal_shifter;
reg clk,rst;
reg [3:0]in;
reg [1:0]s;
wire [3:0]q;
wire out;
universal_shifter uut(.clk(clk), .rst(rst), .in(in), .s(s), .q(q), .out(out));
always #5 clk=~clk;
initial begin
clk=0; rst=1; in=4'b1001; s=00;
#5 rst=1; 
#10 rst=0; in=4'b1010; s=11;
#10 s=00;
#20 s=01;
#50 s=10;
#50 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst =%b | in=%b | s=%b | q=%b | out=%b",$time,clk,rst,in,s,q,out);
$dumpfile("universal_shifter.vcd");
$dumpvars(0,tb_universal_shifter);
end
endmodule
