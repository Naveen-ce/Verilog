module function_mux_4_1(
input s0,s1,
input [3:0]i,
output y);
function out;
input x0,x1;
input [3:0]z;
begin
case({x0,x1})
2'b00:out=z[0];
2'b01:out=z[1];
2'b10:out=z[2];
2'b11:out=z[3];
default:out=1'b0;
endcase
end
endfunction
assign y=out(s0,s1,i);
endmodule
