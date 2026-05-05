module tb_function_mux_4_1;
reg s0,s1;
reg [3:0]i;
wire y;
function_mux_4_1 uut(.s0(s0), .s1(s1), .i(i), .y(y));
initial begin
s0=0; s1=0; i=4'b0110;
#10 s0=0; s1=1;
#10 s0=1; s1=0;
#10 s0=1; s1=1;
#10 s0=0; s1=0; i=4'b1010;
#10 s0=0; s1=1;
#10 s0=1; s1=0;
#10 s0=1; s1=1; 
 $finish;
end
initial begin
$monitor("Time=%0t | s0=%b | s1=%b | i=%b | y=%b",$time,s0,s1,i,y);
$dumpfile("function_mux_4_1.vcd");
$dumpvars(0,tb_function_mux_4_1);
end
endmodule
