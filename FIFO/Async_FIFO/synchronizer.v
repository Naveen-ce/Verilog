module ptr_sync #(parameter width=4)
(input clk,rst,
	input [width-1:0] ptr,
	output reg [width-1:0] out);
reg [width-1:0]q;
always@(posedge clk or posedge rst) begin
	if(rst)
		q<=0;
		out<=0;
	else begin
		q<=ptr;
	        out<=q;
	end
end
endmodule

