module full_subtractor(
input a,b,bin,
output diff,borrow);
wire v,w,x,y,z;
xor x1(v,a,b);
not n1(w,v);
not n2(x,a);
and a1(y,w,bin);
and a2(z,x,b);
xor x2(diff,v,bin);
or o1(borrow,y,z);
endmodule
