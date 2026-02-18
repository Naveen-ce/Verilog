module tb_conditional;
reg [3:0]a= 4'b110x;
wire y = (a== 4'b1100)?1'b1:1'b0;
initial begin
#5
$display("a=%b | y=%b",a,y);
end
endmodule

