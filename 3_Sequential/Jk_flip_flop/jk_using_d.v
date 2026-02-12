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

module jk_ff(
input clk,rst,j,k,
output q,q_bar);
wire a;
assign a=(j&~q)|(~k&q);
d_ff d1(.d(a), .clk(clk), .rst(rst), .q(q), .q_bar(q_bar));
endmodule
