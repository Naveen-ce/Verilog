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
module d_ff(
input clk,rst,d,
output q,q_bar);
wire d1;
xor x1(d1,q,d);
t_ff t1(.t(d1), .clk(clk), .rst(rst), .q(q), .q_bar(q_bar));
endmodule
