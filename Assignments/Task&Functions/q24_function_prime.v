module prime_no 
#(parameter N=8)
(input [N-1:0]a,
output out);

function prime;
input [N-1:0]n;
integer i;
begin
if(n<=1)
prime=0;
else begin
prime=1;
for(i=2;i<n;i=i+1)begin
if(n%i==0)
prime=0;
end
end
end
endfunction

assign out=prime(a);
endmodule

