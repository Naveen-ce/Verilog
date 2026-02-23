module function_btog(
input [3:0]b,
output [3:0]g);
function [3:0]gray;
input [3:0]x;
begin
gray[3]=x[3];
gray[2]=x[3]^x[2];
gray[1]=x[2]^x[1];
gray[0]=x[1]^x[0];
end
endfunction
assign g=gray(b);
endmodule
