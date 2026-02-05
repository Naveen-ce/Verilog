module mux_4_1(
input sel0,sel1,i0,i1,i2,i3,
output reg out);
always@(*)begin
if(sel0==0)begin
if(sel1==0)
out=i0;
else
out=i1;
end
else begin
if(sel1==0)
out=i2;
else
out=i3;
end
end
endmodule

