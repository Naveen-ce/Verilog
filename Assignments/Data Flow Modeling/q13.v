module tb_ab;
reg [3:0]a;
reg [6:0]b;
initial
begin
a=4'd10;
b={a,1'b1};
$display("a=%d | b=%b",a,b);
end
endmodule
