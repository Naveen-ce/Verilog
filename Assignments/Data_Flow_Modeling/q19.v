module gates;
reg a,b;
wire and_gate,or_gate,nand_gate,xor_gate,xnor_gate;
assign and_gate= (a?b:1'b0);
assign or_gate= (a?1'b1:b);
assign nand_gate= (a?~b:1'b1);
assign xor_gate= (a?~b:b);
assign xnor_gate= (a?b:~b);
initial begin 
a=1; b=1;
#20 b=0;
#20 a=0; b=1;
#20 b=0;
#20 $finish;
end
initial begin 
$monitor("a=%b | b=%b | and_gate=%b | or_gate=%b | nand_gate=%b | xor_gate=%b | xnor_gate=%b",a,b,and_gate,or_gate,nand_gate,xor_gate,xnor_gate);
end
endmodule
