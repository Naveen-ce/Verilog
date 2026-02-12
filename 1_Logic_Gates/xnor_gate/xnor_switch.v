module xnor_gate(
input a,b,
output y);
supply1 vcd;
supply0 gnd;
wire x,w,z,n1,n2;
not g1(n1,a);
not g2(n2,b);
pmos p1(x,vcd,n1);
pmos p2(x,vcd,b);
pmos p3(y,x,a);
pmos p4(y,x,n2);
nmos i1(w,gnd,b);
nmos i2(z,gnd,n2);
nmos i3(y,w,n1);
nmos i4(y,z,a);
endmodule
