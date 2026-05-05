module tb_async_fifo;
parameter depth=8;
parameter width=8;
reg wclk,wrst,rclk,rrst;
reg wrt_en,rd_en;
reg [width-1:0] data_in;
wire [width-1:0] data_out;
wire full,empty;

reg [7:0] mem [7:0];
reg [3:0] wptr,rptr;
reg [7:0] expected;

async_fifo #(.depth(depth), .width(width)) uut(.wclk(wclk), .rclk(rclk), .wrst(wrst), .rrst(rrst), .wrt_en(wrt_en), .rd_en(rd_en), .data_in(data_in), .data_out(data_out), .full(full), .empty(empty));

always #5 wclk=~wclk;
always #10 rclk=~rclk;

task reset();
begin
wrst=1; rrst=1;wrt_en=0; rd_en=0; wptr=0;rptr=0;

#10 wrst=0;rrst=0;
end
endtask

task write_fifo(input [7:0] d_in);
begin
@(posedge wclk);
if(!full) begin
wrt_en=1;
data_in=d_in;
mem[wptr]=d_in;
wptr=wptr+1;
end
else 
wrt_en=0;
end
endtask

task read_fifo();
begin
@(posedge rclk);
if(!empty) begin
rd_en=1;

@(posedge rclk);
rd_en=0;

expected=mem[rptr];
rptr=rptr+1;

#2
if(data_out==expected) 
$display("FIFO PASS | Expected = %b | Actual = %b",expected,data_out);
else
$display("FIFO FAIL | Expected = %b | Actual = %b",expected,data_out);
end
else
rd_en=0;
end
endtask


initial begin
wclk=0; rclk=0; 

reset();

#2 repeat(10)  begin
write_fifo($urandom);
end

#2 repeat(10)begin
read_fifo();
end

#10 $finish;
end

initial begin
$dumpfile("async_fifo_self_check.vcd");
$dumpvars(0,tb_async_fifo);
end
endmodule
