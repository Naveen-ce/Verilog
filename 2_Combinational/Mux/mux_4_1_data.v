module mux_4_1(
input sel0,sel1,i0,i1,i2,i3,
output out);
assign out=sel0?(sel1?i3:i2):(sel1?i1:i0);
endmodule
