module dual #(parameter depth=64, address = 6, width = 8)(
input clk,
input [width-1:0]data_a,data_b,
input [address-1:0]addr_a,addr_b,
input we_a,we_b,
output reg [width-1:0]q_a,q_b);

reg [width-1:0] ram[depth-1:0];

always @(*)
begin
if(we_a)
ram[addr_a] <= data_a;

if(we_b)
ram[addr_b] <= data_b;
end

always @(*)
begin
q_a <= ram[addr_a];
q_b <= ram[addr_b];
end
	

endmodule
