module clk_divider_by_5(
input clk,rst,
output f_by_5);
reg [2:0]count;
reg r_pos,r_neg;

always@(posedge clk or posedge rst) begin
if(rst)
count<=3'b000;
else
count<=count+1;
end

always@(posedge clk or posedge rst) begin
if(rst)
r_pos<=1'b0;
else
if(count==3'b100)
count<=3'b000;

else
r_pos<=(count==3'b000 || count==3'b001);
end

always@(negedge clk or posedge rst) begin
	if(rst)
		r_neg<=1'b0;
	else
		r_neg<=r_pos;
end

assign f_by_5=r_pos | r_neg;
endmodule
