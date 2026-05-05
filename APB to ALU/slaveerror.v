module slave_error #(parameter width=8)
(input clk,rst,
input [width-1:0] paddr,
output reg slaveerr);

always@(posedge clk or posedge rst) begin
	if(rst)
		slaveerr<=1'b0;
         if(paddr>64) 
		slaveerr<=1'b1;
	
	else
		slaveerr<=1'b0;
end
endmodule
 
