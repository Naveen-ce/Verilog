module function_checkpower(
input [31:0]a,
output y);
function power;
input [31:0]x;
begin
if(x==0)begin
$display("It is not the power of two");
power=1'b0;
end
else begin
power=!(x&(x-1));
if(power==1)
$display("It is the power of two");
else
$display("It is not the power of two");	
end
end
endfunction
assign y=power(a);
endmodule

