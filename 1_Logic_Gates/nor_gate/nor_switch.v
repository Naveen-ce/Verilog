module nor_gate(
input a,b,
output y);
supply1 vcd;
supply0 gnd;
wire w;
pmos p1(w,vcd,a);
pmos p2(y,w,b);
nmos n1(y,gnd,a);
nmos n2(y,gnd,b);
endmodule
