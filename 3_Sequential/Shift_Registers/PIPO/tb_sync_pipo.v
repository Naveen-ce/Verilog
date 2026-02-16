module tb_sync_pipo;
reg clk,rst;
reg [3:0]in;
wire [3:0]out;
pipo uut(.clk(clk), .rst(rst), .in(in), .out(out));
always #5 clk=~clk;
initial begin
clk=0; rst=1; in=4'b0010;
#5 rst=1; 
#10 rst=0; in=4'b1010;
#10 in=4'b1001;
#10 in=4'b1110;
#10 in=4'b0010;
#10 rst=1;
#5 rst=0;
#10 in=4'b1000;
#10 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst =%b | in=%b | out=%b",$time,clk,rst,in,out);
$dumpfile("sync_pipo.vcd");
$dumpvars(0,tb_sync_pipo);
end
endmodule
