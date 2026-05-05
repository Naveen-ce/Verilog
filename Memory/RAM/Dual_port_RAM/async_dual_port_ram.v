module async_dual_port_ram #(parameter width=8,addrr=6,depth=64)
(input clk,wr_ena,wr_enb,
input [addrr-1:0] addra,addrb,
input [width-1:0] d_ina,d_inb,
output reg  [width-1:0] d_outa,
output  reg [width-1:0] d_outb);

reg [width-1:0] ram[0:depth-1];

always@(posedge clk) begin
	if(addra != addrb) begin

	if(wr_ena)
		ram[addra]<=d_ina;
	

	if(wr_enb)
		ram[addrb]<=d_inb;
	
end
else begin
	if(wr_ena) 
                ram[addra]<=d_ina;
        
end
end

always@(*) begin
	if(!wr_ena)
 d_outa=ram[addra];

if(!wr_enb)
d_outb=ram[addrb];
end
endmodule

