module function_oddparity 
#(parameter N=4)
(input [N-1:0]a,
output odd_parity);
function  odd;
input [N-1:0]x;
begin
odd=~^a;
end
endfunction
assign odd_parity=odd(a);
endmodule 
