module function_apb(
input [31:0]a,b,
output [31:0]y);

function [31:0] out;
input [31:0]x,z;
integer i;
begin
out=1;	
for(i=1;i<=z;i=i+1)begin
out=out*x;
end
end
endfunction

assign y=out(a,b);
endmodule


