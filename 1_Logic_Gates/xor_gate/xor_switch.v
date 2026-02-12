module xor_gate(
input a,b,
output y);
supply1 vcd;
supply0 gnd;
wire n1,n2,x,w,z;
not g1(n1,a);
not g2(n2,b);
pmos p1(x,vcd,n1);
pmos p2(x,vcd,n2);
pmos p3(y,x,a);
pmos p4(y,x,b);
nmos i1(w,gnd,n2);
nmos i2(z,gnd,b);
nmos i3(y,w,n1);
nmos i4(y,z,a);
endmodule
