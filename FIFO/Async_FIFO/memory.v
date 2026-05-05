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

