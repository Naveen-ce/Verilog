module clk_divider_by_6(
input clk,rst,
output f_by_6);
reg [2:0] count;
reg r_pos;
reg r_neg;
always@(posedge clk or posedge rst) begin
	if(rst)
		count<=3'b000;
	else
		count<=count+1;
end

always@(posedge clk or posedge rst) begin
	if(rst)
		r_pos<=1'b0;
		
        else begin
        if (count<=3'b011) 
                  r_pos<=1'b1;
         else if(count==3'b100) begin        
                  r_pos<=1'b0;
                  count<=3'b111;
                  end
                
end
end

always@(negedge clk or posedge rst) begin
	if(rst)
		r_neg<=1'b0;
	else
		r_neg<=r_pos;
end

assign f_by_6= r_pos | r_neg;
endmodule

