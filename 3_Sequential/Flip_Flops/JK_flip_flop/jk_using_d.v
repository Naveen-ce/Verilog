module d_ff(
input d, clk,rst,
output reg q,
output q_bar);
always @(posedge clk or posedge rst)
begin
if(rst)
 q<=1'b0;
else
 q<=d;
end
assign q_bar=~q;
endmodule

module jk_ff(
input j,k,clk,rst,
output q,q_bar);
assign d= (j&~q)|(~k&q);
d_ff jk1(
.d(d),
.clk(clk),
.rst(rst),
.q(q), .q_bar(q_bar));
endmodule
