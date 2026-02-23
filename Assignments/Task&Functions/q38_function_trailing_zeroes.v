module function_trailingzeroes #(parameter N=8)
(input [N-1:0]a,
output [5:0]y);

function [5:0] zeroes;
input [N-1:0]x;
integer i;
begin
zeroes=0;
for(i=0;i<8;i=i+1)begin
if(x[i]==0)
zeroes=zeroes+1; 
else
i=8;
end
end
endfunction

assign y=zeroes(a);
endmodule
