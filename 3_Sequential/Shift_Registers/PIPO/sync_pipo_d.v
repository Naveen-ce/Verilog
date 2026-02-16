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

module pipo(
input clk,rst,
input [3:0]in,
output [3:0] out);
wire [3:0]q;
d_ff d1(.clk(clk), .rst(rst), .d(in[0]), .q(q[0]));
d_ff d2(.clk(clk), .rst(rst), .d(in[1]), .q(q[1]));
d_ff d3(.clk(clk), .rst(rst), .d(in[2]), .q(q[2]));
d_ff d4(.clk(clk), .rst(rst), .d(in[3]), .q(q[3]));
assign out=q;
endmodule
