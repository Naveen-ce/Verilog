module full_adder(
input a,b,cin,
output sum,carry);
wire x,y,z;
xor x1(x,a,b);
and a1(y,x,cin);
and a2(z,a,b);
xor x2(sum,x,cin);
or o1(carry,y,z);
endmodule
