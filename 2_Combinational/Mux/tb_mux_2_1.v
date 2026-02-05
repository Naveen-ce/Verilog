module tb_mux_2_1;
reg sel,i0,i1;
wire out;
mux_2_1 m1(.sel(sel), .i0(i0), .i1(i1), .out(out));
initial begin
sel=0; i0=0; i1=0;
#10 sel=0; i0=0; i1=1;
#10 sel=0; i0=1; i1=0;
#10 sel=0; i0=1; i1=1;
#10 sel=1; i0=0; i1=0;
#10 sel=1; i0=0; i1=1;
#10 sel=1; i0=1; i1=0;
#10 sel=1; i0=1; i1=1;
#10 $finish;
end
initial begin
$monitor("Time=%0t | sel=%0b | i0=%0b | i1=%0b | out=%0b",$time,sel,i0,i1,out);
$dumpfile("tb_mux_2_1.vcd");
$dumpvars(0,tb_mux_2_1);
end
endmodule
