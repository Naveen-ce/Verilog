module mux_2_1(
input sel,i0,i1,
output reg out);
always@(sel or i0 or i1)begin
if (sel==1)
out=i1;
else
out=i0;
end
endmodule
