module full_adder (
  input a,b,cin,
  output sum,
  output carry);
  assign sum=a^b^cin;
  assign carry=(a&b) | (b&cin) | (a&cin);
endmodule

module ripple_carry_adder #(parameter N=4)
(input [N-1:0]a,b,
 input cin,
 output [N-1:0]sum,
 output cout);
wire [N-1:0]c;

full_adder f1(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .carry(c[0]));
genvar i;
generate
	for(i=1;i<N;i=i+1) begin
	full_adder f2(.a(a[i]), .b(b[i]), .cin(c[i-1]), .sum(sum[i]), .carry(c[i])); 
end
endgenerate
assign cout=c[3];
endmodule

