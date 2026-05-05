module function_sub(
input [3:0]a,b,
output [4:0]diff);
function [4:0]subtractor;
input [3:0]x,y;
begin
subtractor=x-y;
end
endfunction
assign diff=subtractor(a,b);
endmodule

