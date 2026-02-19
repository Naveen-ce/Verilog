
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

module piso(
input clk,rst,load,
input[3:0]in,
output out);
wire [3:0]q,a,b;
assign a=~in;
assign b=~q;
sr_ff jk1(.clk(clk), .rst(rst), .s(load?in[0]:1'b0), .r(load?a[0]:1'b1), .q(q[0]));
sr_ff jk2(.clk(clk), .rst(rst), .s(load?in[1]:q[0]), .r(load?a[1]:b[0]), .q(q[1]));
sr_ff jk3(.clk(clk), .rst(rst), .s(load?in[2]:q[1]), .r(load?a[2]:b[1]), .q(q[2]));
sr_ff jk4(.clk(clk), .rst(rst), .s(load?in[3]:q[2]), .r(load?a[3]:b[2]), .q(q[3]));
assign out=q[3];
endmodule
