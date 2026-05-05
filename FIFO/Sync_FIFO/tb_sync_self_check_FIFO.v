module tb_fifo;
parameter depth=8;
parameter width=8;
reg clk,rst;
reg write_enable,read_enable;
reg [width-1:0] data_in;
wire [width-1:0] data_out;
wire full,empty;

reg [7:0] mem[0:7];
reg [3:0] wptr,rptr;
reg [7:0] expected;

sync_fifo #(.depth(depth), .width(width)) uut(.clk(clk), .rst(rst), .write_enable(write_enable), .read_enable(read_enable), .data_in(data_in), .data_out(data_out), .full(full), .empty(empty));

always #5 clk=~clk;

task reset();
begin
 rst=1; write_enable=0;read_enable=0;wptr=0;rptr=0;

#20 rst=0;
end
endtask

task write_fifo(input [7:0] din);
begin
@(posedge clk);
if(!full) begin
write_enable=1; read_enable=0;
data_in=din;
mem[wptr]=din;
wptr=wptr+1;
end
end
endtask

task read_fifo;
begin
@(posedge clk);
if(!empty) begin
write_enable=0;
read_enable=1;
expected=mem[rptr];
rptr=rptr+1;

#2;
if(data_out==expected)
$display("FIFO PASS expected=%0d actual=%0d",expected,data_out);
else
$display("FIFO FAIL expected=%0d actual=%0d",expected,data_out);
end
end
endtask



initial begin
clk=0;
reset();

repeat(20) begin
write_fifo($urandom);
end

#1
repeat(20) begin
read_fifo();
end
#50 $finish;
end



initial begin
$dumpfile("sync_fifo.vcd");
$dumpvars(0,tb_fifo);
end
endmodule
