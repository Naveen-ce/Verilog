module jk_ff(
input clk,rst,j,k,
output reg q);
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
endmodule

module piso(
input clk,rst,load,
input[3:0]in,
output out);
wire [3:0]q,a,b;
assign a=~in;
assign b=~q;
	jk_ff jk1(.clk(clk), .rst(rst), .j(load?in[0]:1'b0), .k(load?a[0]:1'b1), .q(q[0]));
jk_ff jk2(.clk(clk), .rst(rst), .j(load?in[1]:q[0]), .k(load?a[1]:b[0]), .q(q[1]));
jk_ff jk3(.clk(clk), .rst(rst), .j(load?in[2]:q[1]), .k(load?a[2]:b[1]), .q(q[2]));
jk_ff jk4(.clk(clk), .rst(rst), .j(load?in[3]:q[2]), .k(load?a[3]:b[2]), .q(q[3]));
assign out=q[3];
endmodule
