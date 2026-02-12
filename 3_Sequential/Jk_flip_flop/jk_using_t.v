module t_ff(
input clk,rst,t,
output reg q,
output q_bar);
always@(posedge clk or posedge rst)begin
if(rst)
q<=1'b0;
else if(t)
q<=~q;
else
q<=q;
end
assign q_bar=~q;
endmodule

module jk_ff(
input clk,rst,j,k,
output q,q_bar);
assign a=(j&~q)|(k&q);
t_ff t1(.t(a), .clk(clk), .rst(rst), .q(q), .q_bar(q_bar));
endmodule
