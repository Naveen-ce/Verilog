module piso(
input clk,rst,load,
input[3:0]in,
output reg out);
reg [3:0]q;
always@(posedge clk or posedge rst)begin
if(rst)
q=4'b0000;
else if (load)
q=in;
else begin
q=({in,q[3:1]});
out=q[0];
end
end
endmodule

