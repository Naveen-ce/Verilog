
module sr_ff(
input s,r,clk,rst,
output reg q,
output q_bar);
always @(posedge clk or posedge rst)
begin 
if(rst)
q<=1'b0;
else
case({s,r})
2'b00:q<=q;
2'b01:q<=1'b0;
2'b10:q<=1'b1;
2'b11:q<=1'bx;
endcase
end
assign q_bar=~q;
endmodule

module t_ff(
input t,clk,rst,
output q,q_bar);
assign d0= t&~q;
assign d1= t&q;
sr_ff sr1(
.s(d0),
.r(d1),
.clk(clk),
.rst(rst),
.q(q), .q_bar(q_bar));
endmodule

