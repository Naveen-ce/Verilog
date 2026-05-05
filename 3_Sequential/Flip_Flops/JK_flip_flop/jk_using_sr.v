
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


module jk_ff(
input j,k,clk,rst,
output q,q_bar);
assign s = j&~q;
assign r = k &q;
sr_ff jk1(
.s(s),
.r(r),
.clk(clk),
.rst(rst),
.q(q), .q_bar(q_bar));
endmodule

