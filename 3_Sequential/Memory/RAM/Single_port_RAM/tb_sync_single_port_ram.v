module tb_sync_single_port_ram;
parameter width=8;
parameter addrr=6;
parameter depth=64;
reg clk,en;
reg [addrr-1:0] addr;
reg [width-1:0] data_in;
wire [width-1:0] data_out;

sync_single_prt_RAM #(.width(width), .addrr(addrr), .depth(depth)) uut(.clk(clk), .en(en), .addr(addr), .data_in(data_in), .data_out(data_out));

always #5 clk=~clk;

initial begin
clk=0; addr=6'b101010; data_in=8'b10001010;
 #10 addr=6'b000000;  data_in=8'b10101000; en=1; 
 #10 addr=6'b000001; data_in=8'b10101001; en=1;  
 #10 addr=6'b000011; data_in=8'b10101010; en=1;  
 #10 addr=6'b000101; data_in=8'b10101011; en=1;  
 #10 addr=6'b001001; data_in=8'b10101100; en=1;  
 #10 addr=6'b010001; data_in=8'b10101101; en=1;  
 #10 addr=6'b100001; data_in=8'b10101110; en=1;  
 #10 addr=6'b110001; data_in=8'b10101111; en=1;  
 #10 addr=6'b000000; data_in=8'b00110011; en=1;
 #10 addr=6'b000000; data_in=8'b10001010; en=0;  
 #10 addr=6'b000001; data_in=8'b10011010; en=0;  
 #10 addr=6'b000011; data_in=8'b10101010; en=0;  
 #10 addr=6'b000101; data_in=8'b10111010; en=0;  
 #10 addr=6'b001001; data_in=8'b11001010; en=0;  
 #10 addr=6'b010001; data_in=8'b11011010; en=0;  
 #10 addr=6'b100001; data_in=8'b11101010; en=0;  
 #10 addr=6'b110001; data_in=8'b11101010; en=0;  
 #10; $finish;
end

initial begin
$monitor("Time=%0t | clk=%b | addr=%b | data_in=%b | en=%b  | data_out=%b",$time,clk,addr,data_in,en,data_out);
$dumpfile("sync_single_port_ram.vcd");
$dumpvars(0,tb_sync_single_port_ram);
end
endmodule
