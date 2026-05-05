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

module async_up_counter(
input clk,
input rst,
output [3:0]count);
wire [3:0]q,q_bar;
d_ff d1(.clk(clk), .rst(rst), .d(1'b1), .q(q[0]), .q_bar(q_bar[0]));
d_ff d2(.clk(q_bar[0]), .rst(rst), .d(q[0]), .q(q[1]), .q_bar(q_bar[1]));
d_ff d3(.clk(q_bar[1]), .rst(rst), .d(q[1]), .q(q[2]), .q_bar(q_bar[2]));
d_ff d4(.clk(q_bar[2]), .rst(rst), .d(q[2]), .q(q[3]), .q_bar(q_bar[3]));
assign count=q;
endmodule
