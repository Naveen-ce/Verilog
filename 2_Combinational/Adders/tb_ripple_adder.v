module tb_ripple_adder;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;
ripple_carry_adder dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
initial begin
a=4'b0000; b=4'b0000; cin=0;
#10 a=4'b0001; b=4'b0000; cin=0;
 #10 a=4'b0010; b=4'b1000; cin=0; 
 #10 a=4'b1000; b=4'b0011; cin=1; 
 #10 a=4'b1001; b=4'b0001; cin=0; 
 #10 a=4'b0100; b=4'b0110; cin=0; 
 #10 a=4'b0101; b=4'b0111; cin=1; 
 #10 a=4'b1001; b=4'b0010; cin=0; 
 #10 a=4'b0001; b=4'b0101; cin=0; 
 #20 $finish;
 end
 initial begin
$monitor("Time=%0t | a=%b | b=%b | cin=%b | sum=%b | cout=%b",$time,a,b,cin,sum,cout);
$dumpfile("tb_ripple_adder.vcd");
$dumpvars(0,tb_ripple_adder);
end
endmodule
