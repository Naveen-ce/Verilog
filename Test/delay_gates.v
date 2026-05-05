module delay_gates(
input A,B,C,D,E,
output f);
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,x,y;

not #(4) n1(w1,B);
not #(4) n2(w2,C);
not #(4) n3(w3,D);

and #(3) a1(w4,A,w1);
and #(3) a2(w5,w4,w2);
and #(3) a3(w6,A,B);
and #(3) a4(w7,w6,E);
and #(3) a5(w8,w1,C);
and #(3) a6(w9,C,w3);

or #(2) o1(x,w5,w7);
or #(2) o2(y,w8,w9);
or #(2) o3(f,x,y);
endmodule
