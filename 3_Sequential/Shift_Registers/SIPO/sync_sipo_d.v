module d_ff(
input clk,rst,d,
output reg q);
always@(posedge clk or posedge rst)begin
if(rst)
q<=1'b0;
else
q<=d;
end
endmodule

module sipo(
input clk,rst,
input in,
output [3:0]out);
wire [3:0]q;
d_ff d1(.clk(clk), .rst(rst), .d(in), .q(q[0]));
d_ff d2(.clk(clk), .rst(rst), .d(q[0]), .q(q[1]));
d_ff d3(.clk(clk), .rst(rst), .d(q[1]), .q(q[2]));
d_ff d4(.clk(clk), .rst(rst), .d(q[2]), .q(q[3]));
assign out=q;
endmodule
