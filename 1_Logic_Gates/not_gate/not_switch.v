module not_gate(
input a,
output y);
supply1 vcd;
supply0 gnd;
pmos p1(y,vcd,a);
nmos n1(y,gnd,a);
endmodule
