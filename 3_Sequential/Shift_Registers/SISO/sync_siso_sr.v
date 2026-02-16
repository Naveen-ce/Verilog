module sr_ff(
input clk,rst,s,r,
output reg q,
output q_bar);
always@(posedge clk or posedge rst)begin
	if(rst)
		q<=1'b0;
	else begin
case({s,r})
2'b00:q<=q;
2'b01:q<=1'b0;
2'b10:q<=1'b1;
2'b11:q<=1'bx;
default:q<=1'b0;
endcase
end
end
assign q_bar=~q;
endmodule

module siso(
input clk,rst,in,
output out);
wire [3:0]q,q_bar;
assign a=~in;
sr_ff sr1(.clk(clk), .rst(rst), .s(in), .r(a), .q(q[0]), .q_bar(q_bar[0]));
sr_ff sr2(.clk(clk), .rst(rst), .s(q[0]), .r(q_bar[0]), .q(q[1]), .q_bar(q_bar[1]));
sr_ff sr3(.clk(clk), .rst(rst), .s(q[1]), .r(q_bar[1]), .q(q[2]), .q_bar(q_bar[2]));
sr_ff sr4(.clk(clk), .rst(rst), .s(q[2]), .r(q_bar[2]), .q(q[3]), .q_bar(q_bar[3]));
assign out=q[3];
endmodule

