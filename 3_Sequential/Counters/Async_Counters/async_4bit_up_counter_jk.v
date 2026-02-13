module jk_ff(
input clk,rst,j,k,
output reg q,
output q_bar);
always@(posedge clk or posedge rst)begin
if(rst)
q<=1'b0;
else
case({j,k})
2'b00:q<=q;
2'b01:q<=0;
2'b10:q<=1;
2'b11:q<=~q;
default:q<=1'b0;
endcase
end
assign q_bar=~q;
endmodule

module async_up_counter(
input clk,
input rst,
output [3:0]count);
wire [3:0]q,q_bar;
jk_ff jk1(.clk(clk), .rst(rst), .j(1'b1), .k(1'b1), .q(q[0]), .q_bar(q_bar[0]));
jk_ff jk2(.clk(q_bar[0]), .rst(rst), .j(1'b1), .k(1'b1), .q(q[1]), .q_bar(q_bar[1]));
jk_ff jk3(.clk(q_bar[1]), .rst(rst), .j(1'b1), .k(1'b1), .q(q[2]), .q_bar(q_bar[2]));
jk_ff jk4(.clk(q_bar[2]), .rst(rst), .j(1'b1), .k(1'b1), .q(q[3]), .q_bar(q_bar[3]));
assign count=q;
endmodule
