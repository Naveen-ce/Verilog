module mux_2_1(
input sel,i0,i1,
output out);
wire x,y,z;
not n1(x,sel);
and a1(y,i0,x);
and a2(z,i1,sel);
or o1(out,y,z);
endmodule
