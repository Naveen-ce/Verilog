module mux_4_1(
input sel0,sel1,i0,i1,i2,i3,
output out);
wire u,v,w,x,y,z;
not n1(u,sel0);
not n2(v,sel1);
and a1(w,u,v,i0);
and a2(x,u,sel1,i1);
and a3(y,sel0,v,i2);
and a4(z,sel0,sel1,i3);
or o1(out,w,x,y,z);
endmodule
