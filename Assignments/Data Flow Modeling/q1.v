module octal;
reg [5:0] y;
initial
begin
y= 'Ox2;
$display("y=%b",y);
end
endmodule
