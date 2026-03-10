module wr_ptr #(parameter width=4)
(input wclk,wrst,wrt_en,
	input[width-1:0] rptr_sync,
	output wfull,
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
		wptr_gray<=wptr_gray_next;
                wfull<=t_full;
	end
end

assign t_full=(wptr_gray_nxt =={~rptr_sync[width-1:width-2],rptr_sync[width-3:0]});
endmodule

