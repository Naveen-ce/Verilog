module and_gate(
input a,b,
output y);
supply1 vcd;
supply0 gnd;
wire o,w;
pmos p1(o,vcd,a);
pmos p2(o,vcd,b);
nmos n1(w,gnd,a);
nmos n2(o,w,b);
pmos i1(y,vcd,o);
nmos i2(y,gnd,o);
endmodule
