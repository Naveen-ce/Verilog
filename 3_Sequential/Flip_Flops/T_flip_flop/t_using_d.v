module d_ff(
input clk,rst,d,
output reg q,
output q_bar);
always@(posedge clk or posedge rst)begin
if(rst)
q<=1'b0;
else
q<=d;
end
assign q_bar=~q;
endmodule

module t_ff(
input clk,rst,t,
output q,q_bar);
assign a=t^q;
d_ff d1(.clk(clk), .rst(rst), .d(a), .q(q), .q_bar(q_bar));
endmodule
