module tb_logical;
reg [3:0]a= 4'b110x;
initial
begin
if (a== 4'b1100)
begin: B1
$display("B1");
end
else
begin: B2
$display("B2");
end
end
endmodule
