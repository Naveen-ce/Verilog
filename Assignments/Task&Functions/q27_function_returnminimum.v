module function_returnminimum
#(parameter N=8)
(input [N-1:0]a,b,
output [N-1:0]y);
function [N-1:0]compare;
input [N-1:0]x,y;
begin
if(x>y)
compare=y;
else
compare=x;
end
endfunction
assign y=compare(a,b);
endmodule 
