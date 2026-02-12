module half_subtractor(
input a,b,
output diff,borrow);
assign diff=a^b;
assign borrow=~a&b;
endmodule
module full_subtractor(
input a,b,bin,
output diff,borrow);
wire x,y,z;
half_subtractor h1(.a(a), .b(b), .diff(x), .borrow(y));
half_subtractor h2(.a(x), .b(bin), .diff(diff), .borrow(z));
or o1(borrow,y,z);
endmodule
