module tb_sync_piso;
reg clk,rst,load;
reg [3:0]in;
wire out;
piso uut(.clk(clk), .rst(rst), .load(load), .in(in), .out(out));
always #5 clk=~clk;
initial begin
clk=0; rst=1; in=4'b0101; load=1;
#5 rst=1; 
#10 rst=0; in=4'b1011; load=1;
#10 load=0;
#50 rst=1;
#10 rst=0; in=4'b1010; load=1;
#5 load=0;
#50 $finish;
end
initial begin
$monitor("Time=%0t | clk=%b | rst =%b | load=%b |  in=%b | out=%b",$time,clk,rst,load,in,out);
$dumpfile("sync_piso.vcd");
$dumpvars(0,tb_sync_piso);
end
endmodule
