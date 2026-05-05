module tb_sync_sipo;
reg clk,rst;
reg in;
wire [3:0]out;
sipo uut(.clk(clk), .rst(rst), .in(in), .out(out));
always #5 clk=~clk;
initial begin
clk=0; rst=1; in=1;
#5 rst=1; 
#10 rst=0; in=1;
#10 in=0;
#10 in=1;
#10 in=0;
#10 rst=1;
#5 rst=0;
#10 in=0;
#5 in=1;
#10 in=1;
#10 in=0;
#10 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst =%b | in=%b | out=%b",$time,clk,rst,in,out);
$dumpfile("sync_sipo.vcd");
$dumpvars(0,tb_sync_sipo);
end
endmodule
