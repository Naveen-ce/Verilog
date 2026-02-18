module tb_mux_4_1;
reg s0,s1;
reg i0,i1,i2,i3;
wire y;
mux_4_1 m1(.s0(s0), .s1(s1), .i0(i0), .i1(i1), .i2(i2), .i3(i3), .y(y));
initial begin
i0=1; i1=1; i2=0; i3=1;
s0=0; s1=0;
#10 s0=0; s1=1;
#10 s0=1; s1=0;
#10 s0=1; s1=1;
#20 i0=0; i1=0; i2=1; i3=0;
#10 s0=0; s1=0;
#10 s0=0; s1=1;
#10 s0=1; s1=0;
#10 s0=1; s1=1;
#10 $finish;
end
initial begin
$monitor("Time=%0t | s0=%0b | s1=%0b | i0=%0b | i1=%0b | i2 =%0b | i3=%0b | y=%0b",$time,s0,s1,i0,i1,i2,i3,y);
$dumpfile("tb_mux_4_1.vcd");
$dumpvars(0,tb_mux_4_1);
end
endmodule
