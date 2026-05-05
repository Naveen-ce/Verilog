module clk_divider(
input clk_1,rst,
output clk_2);

reg[17:0] count;

always@(posedge clk_1 or posedge rst) begin
if(rst) begin
	 count<=18'b0;
	 clk_2<=0;
end

else if(count==2_49_999)begin
	count<=18'b0;
	clk_2<=~clk_2;
end

else
	count<=count+1'b1;
end
endmodule

    
