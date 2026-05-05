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

module sipo(
input clk,rst,in,
output [3:0]out);
wire [3:0]q,q_bar;
assign a=~in;
jk_ff jk1(.clk(clk), .rst(rst), .j(in), .k(a), .q(q[0]), .q_bar(q_bar[0]));
jk_ff jk2(.clk(clk), .rst(rst), .j(q[0]), .k(q_bar[0]), .q(q[1]), .q_bar(q_bar[1]));
jk_ff jk3(.clk(clk), .rst(rst), .j(q[1]), .k(q_bar[1]), .q(q[2]), .q_bar(q_bar[2]));
jk_ff jk4(.clk(clk), .rst(rst), .j(q[2]), .k(q_bar[2]), .q(q[3]), .q_bar(q_bar[3]));
assign out=q;
endmodule

