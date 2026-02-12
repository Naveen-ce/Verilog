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

module sr_ff(
input clk,rst,s,r,
output q,q_bar);
wire x,y,z;
and a1(x,s,q_bar);
and a2(y,r,q);
or a3(z,x,y);
t_ff t1(.t(z), .clk(clk), .rst(rst), .q(q), .q_bar(q_bar));
endmodule
