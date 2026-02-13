module async_up_counter(
input clk,
input rst,
output [3:0]count);
reg [3:0]q;
wire [3:0]q_bar;

always@(posedge clk or posedge rst)begin
if(rst)
q<=4'b0000;
else
q[0]<=q[0]+1;
end

always@(posedge q_bar[0] or posedge rst)begin
if(rst)
q<=4'b0000;
else
q[1]<=q[1]+1;
end

always@(posedge q_bar[1] or posedge rst)begin
if(rst)
q<=4'b0000;
else
q[2]<=q[2]+1;
end

always@(posedge q_bar[2] or posedge rst)begin
if(rst)
q<=4'b0000;
else
q[3]<=q[3]+1;
end
assign count=q;
assign q_bar=~q;
endmodule
