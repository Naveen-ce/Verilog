module mux_2_1(
input sel,i0,i1,
output out);
assign out=sel?i1:i0;
endmodule
