module test(output [32:0]b);
real a=14.5;
assign b = a;
always@(a or b)begin
$display("a=%b | b=%b",a,b);
end
endmodule
