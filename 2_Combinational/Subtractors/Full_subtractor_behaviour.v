module full_subtractor(
input a,b,bin,
output reg diff,borrow);
always@(a or b or bin) begin
diff=a^b^bin;
borrow=(~(a^b)&bin)|(~a&b);
end
endmodule
