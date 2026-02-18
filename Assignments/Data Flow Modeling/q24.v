module tb_acc;
reg [3:0] acc;
initial begin
acc = 4'b0001;
while (acc < 4'b1000) begin
acc = acc + 1;
end
$display("acc = %b", acc);
end
endmodule
