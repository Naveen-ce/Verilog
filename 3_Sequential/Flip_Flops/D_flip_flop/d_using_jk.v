module jk_ff(
input clk,rst,j,k,
output reg q,
output q_bar);
always@(posedge clk or posedge rst)begin
	if(rst)
		q<=1'b0;
	else begin
case({j,k})
2'b00:q<=q;
2'b01:q<=1'b0;
2'b10:q<=1'b1;
2'b11:q<=~q;
default:q<=1'b0;
endcase
end
end
assign q_bar=~q;
endmodule
module d_ff(
input clk,rst,d,
output q,q_bar);
wire d1;
not n1(d1,d);
jk_ff jk1(.j(d), .k(d1), .clk(clk), .rst(rst), .q(q), .q_bar(q_bar));
endmodule
