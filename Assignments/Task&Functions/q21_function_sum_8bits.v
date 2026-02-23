module function_sum(
input [7:0]a,b,
output [8:0]sum);
function [7:0]adder;
input [7:0]x,y;
begin
adder=x+y;
end
endfunction
assign sum=adder(a,b);
endmodule
