module function_evenparity 
#(parameter N=4)
(input [N-1:0]a,
output even_parity);
function  even;
input [N-1:0]x;
begin
even=^a;
end
endfunction
assign even_parity=even(a);
endmodule 
