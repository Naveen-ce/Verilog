module tb_bidirectional_shifter;
reg clk,rst,mode;
reg in;
wire out;
bidirectional_shifter uut(.clk(clk), .rst(rst), .mode(mode),  .in(in), .out(out));
always #5 clk=~clk;
initial begin
clk=0; rst=1; in=1; mode=1;
#5 rst=1; 
#10 rst=0; in=1; mode=1;
#10 in=0;
#10 in=1;
#10 in=0;
#30 rst=1;
#5 rst=0; mode=0;
#5 in=1;
#10 in=0;
#30 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst =%b | mode=%b |  in=%b | out=%b",$time,clk,rst,mode,in,out);
$dumpfile("bidirectional_shifter.vcd");
$dumpvars(0,tb_bidirectional_shifter);
end
endmodule
