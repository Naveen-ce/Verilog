`include "master_apb.v"
`include "slave_apb.v"
`include "slaveerror.v"



module top_module #(parameter width=8,depth=64)

(input pclk,
input presetn,
input transfer,
input read_write,
input [width-1:0] write_paddr,
input [width-1:0] write_data,
input [width-1:0] read_paddr,
output [width-1:0] read_data_out,
output slave_error);

wire pwrite;
wire pready;
wire [width-1:0] prdata;
wire psel1;
wire [width-1:0] p_addr;
wire [width-1:0] p_wdata;
wire penable;
wire slaveerr;


master #(.width(width)) m1(.pclk(pclk),
.rst(presetn),
.transfer(transfer),
.read_write(read_write),
.write_paddr(write_paddr),
.write_data(write_data),
.read_paddr(read_paddr),
.pready(pready),
.prdata(prdata),
.read_data_out(read_data_out),
.pwrite(pwrite),
.psel1(psel1),
.penable(penable),
.paddr(p_addr),
.pwdata(p_wdata));

slave_apb #(.width(width), .depth(depth)) s1(.pclk(pclk), .rst(presetn), .pwrite(read_write),
	.psel1(psel1),
	.penable(penable),
	.paddr(p_addr),
	.pwdata(p_wdata),
	.pready(pready),
	.prdata(prdata));
	
slave_error #(.width(width)) se1(.clk(pclk), .rst(presetn), .paddr(p_addr), .slaveerr(slaveerr));	

assign read_data_out=prdata;
assign slave_error=slaveerr;
endmodule



