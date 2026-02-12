module or_gate(
input a,b,
output y);
supply1 vcd;
supply0 gnd;
wire w,o;
pmos p1(w,vcd,a);
pmos p2(o,w,b);
nmos n1(o,gnd,a);
nmos n2(o,gnd,b);
pmos i1(y,vcd,o);
nmos i2(y,gnd,o);
endmodule
