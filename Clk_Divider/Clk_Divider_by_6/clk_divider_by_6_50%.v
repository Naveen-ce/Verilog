module clk_divider_by_6(
input clk,rst,
output reg f_by_6);
reg [1:0] count;
always@(posedge clk or posedge rst) begin
if(rst) begin
f_by_6<=1'b0;
count<=2'b00;
end
else begin
  count<=count+1;
  if(count==2'b10) begin
      f_by_6<=~f_by_6;
      count<=2'b0;
  end
     	
end
end
endmodule
