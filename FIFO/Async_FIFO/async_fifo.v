//Memory 
module memory #(parameter width=8,depth=8)
(input wclk,rclk,wrt_en,rd_en,
input[$clog2(depth):0]wptr,rptr,
input [width-1:0] data_in,
input full,empty,
output reg [width-1:0] data_out
);

reg [width-1:0] fifo[depth-1:0];

always@(posedge wclk) begin
	if(wrt_en && !full) begin
		fifo[wptr[$clog2(depth)-1:0]]<=data_in;
	end
end

always@(posedge rclk) begin
	if(rd_en && !empty)  begin
		data_out<=fifo[rptr[$clog2(depth)-1:0]];
	end
end
endmodule



//Synchronizer
module ptr_sync #(parameter width=4)
(input clk,rst,
	input [width-1:0] ptr,
	output reg [width-1:0] out);
reg [width-1:0]q;
always@(posedge clk or posedge rst) begin
	if(rst)begin
		q<=0;
		out<=0;
	end
	else begin
		q<=ptr;
	        out<=q;
	end
end
endmodule



//Write logic
module wr_ptr #(parameter width=4)
(input wclk,wrst,wrt_en,
	input[width-1:0] rptr_sync,
	output reg wfull,
	output reg [width-1:0] wptr,
	output reg [width-1:0] wptr_gray);

wire  [width-1:0] wptr_gray_nxt,wptr_nxt;
wire t_full;

assign wptr_nxt=wptr+(wrt_en && !wfull);
assign wptr_gray_nxt=wptr_nxt^(wptr_nxt>>1);





always@(posedge wclk or posedge wrst)begin
	if(wrst) begin
		wptr<=0;
		wptr_gray<=0;
		wfull<=0;
	end

	else begin
		wptr<=wptr_nxt;
		wptr_gray<=wptr_gray_nxt;
                wfull<=t_full;
	end
end

assign t_full=(wptr_gray_nxt =={~rptr_sync[width-1:width-2],rptr_sync[width-3:0]});
endmodule

//Read logic

 module rd_ptr #(parameter width=4)
(input rclk,rrst,rd_en,
        input[width-1:0] wptr_sync,
        output reg rempty,
        output reg [width-1:0] rptr,
        output reg [width-1:0] rptr_gray);

wire  [width-1:0] rptr_gray_nxt,rptr_nxt;
wire t_empty;

assign rptr_nxt=rptr+(rd_en && !rempty);
assign rptr_gray_nxt=rptr_nxt^(rptr_nxt>>1);





always@(posedge rclk or posedge rrst)begin
        if(rrst) begin
                rptr<=0;
                rptr_gray<=0;
                rempty<=1;
        end

	else  begin
                rptr<=rptr_nxt;
                rptr_gray<=rptr_gray_nxt;
                rempty<=t_empty;
        end
end

assign t_empty=rptr_gray_nxt == wptr_sync;
endmodule



//Top module
module async_fifo #(parameter width=8,depth=8)
(input wclk,
input wrst,
input wrt_en,
input [width-1:0] data_in,
output full,

input rclk,
input rrst,
input rd_en,
output [width-1:0] data_out,
output empty);


localparam ptr=$clog2(depth)+1;

wire [ptr-1:0] r_sync,w_sync;
wire [ptr-1:0] r_gray,w_gray;
wire [ptr-1:0] wptr,rptr;
wire [width-1:0]d_out;
wire tfull,tempty;

//Write Logic
wr_ptr #(.width(ptr)) w1 (.wclk(wclk), .wrst(wrst), .wrt_en(wrt_en), .rptr_sync(r_sync), .wfull(tfull), .wptr(wptr), .wptr_gray(w_gray));


//Read Logic
rd_ptr #(.width(ptr)) r1(.rclk(rclk), .rrst(rrst), .rd_en(rd_en), .wptr_sync(w_sync), .rempty(tempty), .rptr(rptr), .rptr_gray(r_gray));


//Memory
memory #(.width(width), .depth(depth)) m1(.wclk(wclk), .rclk(rclk), .wrt_en(wrt_en), .rd_en(rd_en), .wptr(wptr), .rptr(rptr), .data_in(data_in), .data_out(d_out), .full(tfull), .empty(tempty));


//Wptr Synchronizer
ptr_sync #(.width(ptr)) s1(.clk(rclk), .rst(rrst), .ptr(w_gray), .out(w_sync));


//Rptr Synchronizer
ptr_sync #(.width(ptr)) s2(.clk(wclk), .rst(wrst), .ptr(r_gray), .out(r_sync));


assign data_out=d_out;
assign full=tfull;
assign empty=tempty;
endmodule




















