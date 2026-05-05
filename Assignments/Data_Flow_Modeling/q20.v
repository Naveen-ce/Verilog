module mux_4_1(
input s0,s1,
input i0,i1,i2,i3,
output y);
assign y=(s0?(s1?i3:i2):(s1?i1:i0));
endmodule
