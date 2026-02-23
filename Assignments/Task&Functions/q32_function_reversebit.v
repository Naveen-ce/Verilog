module function_reversebit 
(input [31:0]a,
output [31:0]y);
function [31:0] reverse;
input [31:0]num;
begin
reverse=0;	
while(num>0)begin	
reverse=(reverse*10)+(num%10);
num=num/10;
end
end
endfunction
assign y=reverse(a);
endmodule
