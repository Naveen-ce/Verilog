module tb_shift;
reg [3:0]a;
reg [1:0]x;
initial
begin
a = 4'd10;
x= (a>>1);
$display("a=%d | x=%b",a,x);
end
endmodule
