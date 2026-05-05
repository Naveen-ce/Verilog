module clk_divider_by_2(
input clk,rst,
output reg f_by_2);
always@(posedge clk or posedge rst) begin
if(rst) begin
f_by_2<=1'b0;
end
else
f_by_2<=~f_by_2;
end
endmodule
