module tb_fifo;
parameter depth=8;
parameter width=8;
reg clk,rst;
reg write_enable,read_enable;
reg [width-1:0] data_in;
wire [width-1:0] data_out;
wire full,empty;

sync_fifo #(.depth(depth), .width(width)) uut(.clk(clk), .rst(rst), .write_enable(write_enable), .read_enable(read_enable), .data_in(data_in), .data_out(data_out), .full(full), .empty(empty));

always #5 clk=~clk;

initial begin
clk=0; rst=1; data_in=8'b10001010;
#10 rst=0;
#10 data_in=8'b10101000; write_enable=1; read_enable=0;
#10 data_in=8'b10101001; write_enable=1; read_enable=0;
#10 data_in=8'b10101010; write_enable=1; read_enable=0;
#10 data_in=8'b10101011; write_enable=1; read_enable=0;
#10 data_in=8'b10101100; write_enable=1; read_enable=0;
#10 data_in=8'b10101101; write_enable=1; read_enable=0;
#10 data_in=8'b10101110; write_enable=1; read_enable=0;
#10 data_in=8'b10101111; write_enable=1; read_enable=0;

#10 data_in=8'b10001010; write_enable=0; read_enable=1;
#10 data_in=8'b10011010; write_enable=0; read_enable=1;
#10 data_in=8'b10101010; write_enable=0; read_enable=1;
#10 data_in=8'b10111010; write_enable=0; read_enable=1;
#10 data_in=8'b11001010; write_enable=0; read_enable=1;
#10 data_in=8'b11011010; write_enable=0; read_enable=1;
#10 data_in=8'b11101010; write_enable=0; read_enable=1;
#10 data_in=8'b11101010; write_enable=0; read_enable=1;

#10 $finish;
end

initial begin
$monitor("Time=%0t | clk=%b | rst=%b | data_in=%b | write_enable=%b | read_enable=%b | data_out=%b | full=%b | empty=%b",$time,clk,rst,data_in,write_enable,read_enable,data_out,full,empty);
$dumpfile("sync_fifo.vcd");
$dumpvars(0,tb_fifo);
end
endmodule
