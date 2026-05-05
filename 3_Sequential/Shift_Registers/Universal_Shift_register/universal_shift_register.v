module universal_shifter(
input clk,rst,
input [3:0]in,
input [1:0]s,
output reg[3:0]q,
output reg out);
always@(posedge clk or posedge rst)begin
if (rst)
q<=4'b0000;
else
case({s1,s0})
2'b00:q<=q;
2'b01:
begin 
q<=({in,q[3:1]});
out<=q[0];
end
2'b10:
begin
q<=({q[2:0],in});
out<=q[3];
end
2'b11:q<=in;
default:q<=4'b0000;
endcase
end
endmodule
