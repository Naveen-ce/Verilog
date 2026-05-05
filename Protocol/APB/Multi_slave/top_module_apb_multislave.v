`include "master_apb_multislave.v"
`include "slave_apb_multislave.v"
`include "decoder_apb_multislave.v"
`include "mux_apb_multislave.v"
`include "slaveerror.v"

module top_module #(parameter width=8,depth=256)

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
wire pready0,pready1,pready2,pready3;
//output from mux
wire psel_master;

wire [width-1:0] prdata0,prdata1,prdata2,prdata3;
wire [width-1:0] prdata; // Input from mux
wire psel0,psel1,psel2,psel3;
wire [width-1:0] p_addr;
wire [width-1:0] p_wdata;
wire penable;
wire slave_err;


master #(.width(width)) m1(.pclk(pclk),
.rst(presetn),
.transfer(transfer),
.read_write(read_write),
.write_paddr(write_paddr),
.write_data(write_data),
.read_paddr(read_paddr),
.pready(pready),
.prdata(prdata), //output from mux
.read_data_out(read_data_out),
.pwrite(pwrite),
.psel_master(psel_master),
.penable(penable),
.paddr(p_addr),
.pwdata(p_wdata));




slave_apb #(.width(width), .depth(depth)) s1(.pclk(pclk), .rst(presetn), .pwrite(read_write),
	.psel(psel0),
	.penable(penable),
	.paddr(p_addr),
	.pwdata(p_wdata),
	.pready(pready0),
	.prdata(prdata0));

slave_apb #(.width(width), .depth(depth)) s2(.pclk(pclk), .rst(presetn), .pwrite(read_write),
        .psel(psel1),
        .penable(penable),
        .paddr(p_addr),
        .pwdata(p_wdata),
        .pready(pready1),
        .prdata(prdata1));

slave_apb #(.width(width), .depth(depth)) s3(.pclk(pclk), .rst(presetn), .pwrite(read_write),
        .psel(psel2),
        .penable(penable),
        .paddr(p_addr),
        .pwdata(p_wdata),
        .pready(pready2),
        .prdata(prdata2));

slave_apb #(.width(width), .depth(depth)) s4(.pclk(pclk), .rst(presetn), .pwrite(read_write),
        .psel(psel3),
        .penable(penable),
        .paddr(p_addr),
        .pwdata(p_wdata),
        .pready(pready3),
        .prdata(prdata3));


decoder #(.width(width)) d1(.paddr(p_addr), .psel_in(psel_master), .psel0(psel0), .psel1(psel1), .psel2(psel2), .psel3(psel3));


mux m2(.psel0(psel0), .psel1(psel1), .psel2(psel2), .psel3(psel3), .pready0(pready0), .pready1(pready1), .pready2(pready2), .pready3(pready3), .prdata0(prdata0), .prdata1(prdata1), .prdata2(prdata2), .prdata3(prdata3), .prdata(prdata), .pready(pready));

slave_error #(.width(width)) se1(.clk(pclk), .rst(presetn), .paddr(p_addr), .slaveerr(slave_err));

assign read_data_out=prdata;
assign slave_error=slave_err;
endmodule



