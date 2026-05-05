module clk_divider #(parameter clk_frequency=100000000,spi_clk_freq=1000000)
(input clk,rst,
output reg sclk);

localparam div_factor= (clk_frequency/spi_clk_freq);
localparam max_count=(div_factor/2)-1;

localparam counter_width=$clog2(max_count+1);

reg[counter_width-1:0] count;

always@(posedge clk or posedge rst) begin
	if(rst) begin
		sclk<=0;
		count<=0;
	end
	else if(count==max_count) begin
		sclk<=~sclk;
		count<=0;
	end
	else
		count<=count+1;
end
endmodule
