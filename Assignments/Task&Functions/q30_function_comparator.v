module function_comparator
#(parameter N=4)
(input [N-1:0]a,b,
output y);
function compare;
input [N-1:0]x,y;
begin
if(x==y)
compare=1'b1;
else
compare=1'b0;
end
endfunction
assign y=compare(a,b);
endmodule 
