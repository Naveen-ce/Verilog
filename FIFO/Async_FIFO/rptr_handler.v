module rd_ptr #(parameter width=4)
(input rclk,rrst,rd_en,
        input[width-1:0] wptr_sync,
        output rempty,
        output reg [width-1:0] rptr,
        output reg [width-1:0] rptr_gray);

wire  [width-1:0] rtr_gray_nxt,rptr_nxt;
wire t_empty;

assign rptr_nxt=rptr+(rd_en && !rempty)
assign rptr_gray_nxt=rptr_nxt^(rptr_nxt>>1);





always@(posedge rclk or posedge rrst)begin
        if(wrst) begin
                rptr<=0;
                rptr_gray<=0;
                rempty<=0;
        end

        else begin
                rptr<=rptr_nxt;
                rptr_gray<=rptr_gray_next;
                rempty<=t_empty;
        end
end

assign t_empty=(rptr_gray_nxt == wptr_sync);
endmodule


