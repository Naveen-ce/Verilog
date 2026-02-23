module function_square(
input [31:0]a,
output [31:0]out);
function [31:0]square;
input [31:0]x;
begin
square=x**2;
end
endfunction
assign out=square(a);
endmodule
