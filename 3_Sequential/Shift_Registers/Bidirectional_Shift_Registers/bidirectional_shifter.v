module bidirectional_shifter(
input clk,rst,mode,
input in,
output reg out);
reg [3:0]q;
always@(posedge clk or posedge rst)begin
if(rst)
q<=4'b0000;
else if (mode)begin
q<=({in,q[3:1]});
out<=q[0];
end
else begin
q<=({q[2:0],in});
out<=q[3];
end
end
endmodule
