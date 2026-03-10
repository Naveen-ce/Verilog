module sync_single_prt_RAM #(parameter width=8,addrr=6,depth=64)
(input clk,en,
input [addrr-1:0] addr,
input [width-1:0] data_in,
output reg [width-1:0] data_out);

reg [width-1:0] ram[0:depth-1];

always@(posedge clk) begin
	if(en) begin
		ram[addr]<=data_in;
	end
	else
		data_out<=ram[addr];
end
endmodule
