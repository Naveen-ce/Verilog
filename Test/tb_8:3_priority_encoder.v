module tb_priority_encoder;
reg [7:0]d;
wire [2:0]q;

priority_encoder uut(.d(d), .q(q));
initial begin
d=8'b00000000;
#10 d=8'b00000001;
#10 d=8'b00000011;
#10 d=8'b00000101;
#10 d=8'b00001101;
#10 d=8'b00011101;
#10 d=8'b00101011;
#10 d=8'b01010101;
#10 d=8'b11010101;
#10 $finish;
end

initial begin
$monitor("Time=%0t | d=%b | q=%b",$time,d,q);
$dumpfile("8:3_priority_encoder");
$dumpvars(0,tb_priority_encoder);
end
endmodule 
