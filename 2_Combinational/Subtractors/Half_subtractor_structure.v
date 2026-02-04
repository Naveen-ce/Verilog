module half_subtractor(
input a,b,
output diff,borrow);
wire x;
xor x1(diff,a,b);
not n1(x,a);
and a1(borrow,x,b);
endmodule
