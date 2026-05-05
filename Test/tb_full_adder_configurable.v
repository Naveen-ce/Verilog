module tb_ripple_adder;
parameter N=16;
reg [N-1:0]a,b;
reg cin;
wire [N-1:0]sum;
wire cout;
ripple_carry_adder #(.N(N)) dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
integer i,j;
initial begin
	cin=0;
	for(i=0;i<256;i=i+1)
	begin
	for(j=0;j<250;j=j+1)begin
	a=i;
        b=j;
        #10;
end
end
$finish;
end

always@( a or b) begin
	$strobe("Time=%0t | a=%b | b=%b | cin=%b | sum=%b | cout=%b",$time,a,b,cin,sum,cout);
end

initial begin
$dumpfile("tb_ripple_adder.vcd");
$dumpvars(0,tb_ripple_adder);
end
endmodule

