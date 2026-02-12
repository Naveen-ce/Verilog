module t_ff(
input clk,rst,t,
output reg q,
output q_bar);
always@(posedge clk)begin
if(rst)
q<=1'b0;
else if(t)
q<=~q;
else
q<=q;
end
assign q_bar=~q;
endmodule
