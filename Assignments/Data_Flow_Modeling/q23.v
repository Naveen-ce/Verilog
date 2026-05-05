module tb_sum;
reg [3:0] sum;
integer i;
initial begin
sum = 4'b0000;
for (i = 0; i < 4; i = i + 1) begin
sum = sum + i;
end
$display("i = %0d, sum = %b", i, sum);
end
endmodule
