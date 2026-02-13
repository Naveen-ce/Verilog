module jhonson_counter(
input clk,rst,
output [3:0]count);
reg [3:0]q;
wire q_bar;
assign q_bar=~q[0];
always@(posedge clk or posedge rst)begin
if(rst)
q<=4'b0000;
else
q<=({q_bar,q[3:1]});
end
assign count=q;
endmodule

