module full_adder(
input a,b,cin,
output sum,carry);
assign sum=a^b^cin;
assign carry=((a^b)&cin|a&b);
endmodule

module ripple_carry_adder #(parameter N=4)
(input [N-1:0]a,b,
	input cin,
	output [N-1:0]sum,
	output cout);
wire [N:0]c;
assign c[0]=cin;
genvar i;
generate
for(i=0;i<N;i=i+1)begin
full_adder fa(.a(a[i]), .b(b[i]), .cin(c[i]), .sum(sum[i]), .carry(c[i+1]));
end
endgenerate
assign cout=c[N];
endmodule
