module random;
integer random_no;
integer i;
initial begin
	for(i=0;i<20;i=i+1) begin
		random_no=$urandom_range(200,0)-100;
		#10;
end
$finish;
end

initial begin
	$monitor("Time=%0t | random_no=%0d",$time,random_no);
	$dumpfile("random_no.vcd");
	$dumpvars(0,random);
end
endmodule
