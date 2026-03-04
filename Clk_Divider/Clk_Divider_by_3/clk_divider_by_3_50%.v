module clk_divider_by_3(
input clk,rst,
output f_by_3);
reg [1:0]count;
reg r_pos,r_neg;

always@(posedge clk or posedge rst) begin
if(rst)
count<=2'b00;
else
count<=count+1;
end

always@(posedge clk or posedge rst) begin
if(rst)
r_pos<=1'b0;
else
if(count==2'b10)
count<=2'b00;

else
r_pos<=(count==2'b00 && count==2'b00);
end

always@(negedge clk or posedge rst) begin
	if(rst)
		r_neg<=1'b0;
	else
		r_neg<=r_pos;
end

assign f_by_3=r_pos | r_neg;
endmodule
