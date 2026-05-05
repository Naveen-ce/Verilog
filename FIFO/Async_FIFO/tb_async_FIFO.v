module tb_async_fifo;
parameter depth=8;
parameter width=8;
reg wclk,wrst,rclk,rrst;
reg wrt_en,rd_en;
reg [width-1:0] data_in;
wire [width-1:0] data_out;
wire full,empty;

async_fifo #(.depth(depth), .width(width)) uut(.wclk(wclk), .rclk(rclk), .wrst(wrst), .rrst(rrst), .wrt_en(wrt_en), .rd_en(rd_en), .data_in(data_in), .data_out(data_out), .full(full), .empty(empty));

always #5 wclk=~wclk;
always #10 rclk=~rclk;
initial begin
wclk=0; rclk=0; wrst=1; rrst=1;wrt_en=1; rd_en=0; data_in=8'b10001010;
#10 wrst=0; rrst=0;
#10 data_in=8'b10101000; wrt_en=1; rd_en=0;
#10 data_in=8'b10101001; wrt_en=1; rd_en=0;
#10 data_in=8'b10101010; wrt_en=1; rd_en=0;
#10 data_in=8'b10101011; wrt_en=1; rd_en=0;
#10 data_in=8'b10101100; wrt_en=1; rd_en=0;
#10 data_in=8'b10101101; wrt_en=1; rd_en=0;
#10 data_in=8'b10101110; wrt_en=1; rd_en=0;
#10 data_in=8'b10101111; wrt_en=1; rd_en=0;

#10 data_in=8'b10001010; wrt_en=0; rd_en=1;
#10 data_in=8'b10011010; wrt_en=0; rd_en=1;
#10 data_in=8'b10101010; wrt_en=0; rd_en=1;
#10 data_in=8'b10111010; wrt_en=0; rd_en=1;
#10 data_in=8'b11001010; wrt_en=0; rd_en=1;
#10 data_in=8'b11011010; wrt_en=0; rd_en=1;
#10 data_in=8'b11101010; wrt_en=0; rd_en=1;
#10 data_in=8'b11101010; wrt_en=0; rd_en=1;
#10 data_in=8'b11011010; wrt_en=0; rd_en=1;
#10 data_in=8'b11101010; wrt_en=0; rd_en=1;
#10 data_in=8'b11101010; wrt_en=0; rd_en=1;
#10 data_in=8'b11011010; wrt_en=0; rd_en=1;
#10 data_in=8'b11101010; wrt_en=0; rd_en=1;
#10 data_in=8'b11101010; wrt_en=0; rd_en=1;
#10 data_in=8'b11011010; wrt_en=0; rd_en=1;
#10 data_in=8'b11101010; wrt_en=0; rd_en=1;
#10 data_in=8'b11101010; wrt_en=0; rd_en=1;


#10 $finish;
end

initial begin
$monitor("Time=%0t | wclk=%b | rclk=%b |  wrst=%b | rrst=%b |  data_in=%b | wrt_en=%b | rd_en=%b | data_out=%b | full=%b | empty=%b",$time,wclk,rclk,wrst,rrst,data_in,wrt_en,rd_en,data_out,full,empty);
$dumpfile("async_fifo.vcd");
$dumpvars(0,tb_async_fifo);
end
endmodule
