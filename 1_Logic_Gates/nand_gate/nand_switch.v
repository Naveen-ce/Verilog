module nand_gate(
input a,b,
output y);
supply1 vcd;
supply0 gnd;
wire w;
pmos p1(y,vcd,a);
pmos p2(y,vcd,b);
nmos n1(w,gnd,a);
nmos n2(y,w,b);
endmodule
