module tb_sync_siso;
reg clk,rst;
reg in;
wire out;
siso uut(.clk(clk), .rst(rst), .in(in), .out(out));
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
#5 in=1;
#10 in=0;
#20 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst =%b | in=%b | out=%b",$time,clk,rst,in,out);
$dumpfile("sync_siso.vcd");
$dumpvars(0,tb_sync_siso);
end
endmodule
