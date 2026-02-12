module d_ff(
input clk,rst,d,
output reg q,
output q_bar);
always@(posedge clk)begin
if(rst)
q<=1'b0;
else
q<=d;
end
assign q_bar=~q;
endmodule
