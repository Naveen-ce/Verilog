module half_subtractor(
input a,b,
output reg diff,borrow);
always@(a or b)begin
diff=a^b;
borrow=~a&b;
end
endmodule
