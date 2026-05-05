module function_multiply
#(parameter N=4)
(input [N-1:0]a,b,
output [N+3:0]out);

function [N+3:0] multiply;
input [N-1:0]x,y;
reg [N-1:0] m[N-1:0];
integer i;
begin
	for(i=0;i<4;i=i+1)begin
		if(y[i])
			m[i]=x;
		else
			m[i]=4'b0000;
	end

multiply={3'b0,m[0]}+{2'b0,m[1],1'b0}+{1'b0,m[2],2'b0}+{m[3],3'b0};
end
endfunction

assign out= multiply(a,b);
endmodule


