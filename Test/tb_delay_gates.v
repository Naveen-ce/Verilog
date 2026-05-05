module tb_delay_gates;
reg a,b,c,d,e;
wire f;

delay_gates uut(.A(a), .B(b), .C(c), .D(d), .E(e), .f(f));

initial begin
a=1; b=0; c=1; d=1; e=0;
#10 a=1; b=0; c=0; d=1; e=0;
#10 a=1; b=0; c=1; d=1; e=0;
#10 a=1; b=1; c=0; d=0; e=1;
#10 a=1; b=0; c=1; d=1; e=0;
#10 a=1; b=1; c=0; d=0; e=0;
#10 a=0; b=0; c=1; d=1; e=1;
#10 a=1; b=0; c=0; d=1; e=0;
#10 a=0; b=1; c=1; d=1; e=1;
#10 a=1; b=0; c=0; d=0; e=0;
#10 a=1; b=0; c=1; d=1; e=0;
#10 a=0; b=0; c=1; d=1; e=1;
#10 a=1; b=1; c=1; d=1; e=0;
#10 a=1; b=0; c=0; d=1; e=0;
#10 a=0; b=0; c=1; d=1; e=1;
#10 a=1; b=1; c=1; d=1; e=0;
#10 a=0; b=0; c=0; d=1; e=1;
#10 a=1; b=1; c=1; d=1; e=0;
#10 a=1; b=0; c=0; d=1; e=0;
#10 a=0; b=1; c=0; d=1; e=0;
#10 a=1; b=0; c=1; d=1; e=0;
#10 a=0; b=1; c=1; d=1; e=1;
#10 a=1; b=1; c=0; d=1; e=0;
#10 $finish;
end

initial begin
$monitor("Time=%0t | a=%b | b=%b | c=%b | d=%b | e=%b | f=%b",$time,a,b,c,d,e,f);
#40 $monitoroff;
#90 $monitoron;
$dumpfile("delay_gates.vcd");
$dumpvars(0,tb_delay_gates);
end
endmodule
