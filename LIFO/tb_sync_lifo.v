module tb_lifo;
parameter depth=8;
parameter width=8;
reg clk,rst;
reg push,pop;
reg [width-1:0] data_in;
wire [width-1:0] data_out; 
wire full,empty;
sync_lifo #(.depth(depth), .width(width)) uut(.clk(clk), .rst(rst), .push(push), .pop(pop), .data_in(data_in), .data_out(data_out), .full(full), .empty(empty));

always #5 clk=~clk;

initial begin
clk=0; rst=1; data_in=8'b10001010; push=1; pop=0;
#10 rst=0;
#10 data_in=8'b10101000; push=1; pop=0;
#10 data_in=8'b10101001; push=1; pop=0;
#10 data_in=8'b10101010; push=1; pop=0;
#10 data_in=8'b10101011; push=1; pop=0;
#10 data_in=8'b10101100; push=1; pop=0;
#10 data_in=8'b10101101; push=1; pop=0;
#10 data_in=8'b10101110; push=1; pop=0;
#10 data_in=8'b10101111; push=1; pop=0;

#10 data_in=8'b10001010; push=0; pop=1;
#10 data_in=8'b10011010; push=0; pop=1;
#10 data_in=8'b10101010; push=0; pop=1;
#10 data_in=8'b10111010; push=0; pop=1;
#10 data_in=8'b11001010; push=0; pop=1;
#10 data_in=8'b11011010; push=0; pop=1;
#10 data_in=8'b11101010; push=0; pop=1;
#10 data_in=8'b11101010; push=0; pop=1;

#10 $finish;
end

initial begin
$monitor("Time=%0t | clk=%b | rst=%b | data_in=%b | push=%b | pop=%b | data_out=%b | full=%b | empty=%b",$time,clk,rst,data_in,push,pop,data_out,full,empty);
$dumpfile("sync_lifo.vcd");
$dumpvars(0,tb_lifo);
end
endmodule
