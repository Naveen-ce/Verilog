module tb;
time t;
initial begin
#10 t= $time;
#20 ;
end
initial begin
$monitor("Time=%0t | t=%0t",$time,t);
end
endmodule
