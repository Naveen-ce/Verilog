module t_ff(
input clk,rst,t,
output reg q,
output q_bar);
always@(posedge clk or posedge rst)begin
if(rst)
q<=1'b0;
else if(t)
q<=~q;
else
q<=q;
end
assign q_bar=~q;
endmodule

module async_up_counter(
input clk,
input rst,
output [3:0]count);
wire [3:0]q,q_bar;
t_ff t1(.clk(clk), .rst(rst), .t(1'b1), .q(q[0]), .q_bar(q_bar[0]));
t_ff t2(.clk(q_bar[0]), .rst(rst), .t(1'b1), .q(q[1]), .q_bar(q_bar[1]));
t_ff t3(.clk(q_bar[1]), .rst(rst), .t(1'b1), .q(q[2]), .q_bar(q_bar[2]));
t_ff t4(.clk(q_bar[2]), .rst(rst), .t(1'b1), .q(q[3]), .q_bar(q_bar[3]));
assign count=q;
endmodule
