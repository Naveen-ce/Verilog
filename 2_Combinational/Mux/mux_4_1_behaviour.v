module mux_4_1(
input sel0,sel1,i0,i1,i2,i3,
output reg out);
always@(sel0 or sel1)begin
if(sel0==0 & sel1==0)
out=i0;
else if(sel0==0 & sel1==1)
out=i1;
else if(sel0==1 & sel1==0)
out=i2;
else 
out=i3;
end
endmodule 
