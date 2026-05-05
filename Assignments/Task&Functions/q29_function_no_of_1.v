module function_no_of_1 #(parameter N=8)
(input [N-1:0]a,
output [5:0]y);

function [5:0] ones;
input [N-1:0]x;
integer i;
begin
ones=0;
for(i=0;i<8;i=i+1)begin
if(x[i]==1)
ones=ones+1; 
else
ones=ones;
end
end
endfunction

assign y=ones(a);
endmodule
