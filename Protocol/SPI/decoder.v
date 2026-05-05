 module decoder (input clk,rst,enable,
	 input [1:0] slave_select,
output reg cs1,cs2,cs3,cs4);

always@(posedge clk or posedge rst) begin
	if(rst) begin
		cs1<=1;
	        cs2<=1;
		cs3<=1;
		cs4<=1;
	end
	else if(enable) begin
	        cs1<=1;
                cs2<=1;
                cs3<=1;
                cs4<=1;

		case(slave_select)
			2'b00:cs1<=0;
			2'b01:cs2<=0;
			2'b10:cs3<=0;
			2'b11:cs4<=0;
		endcase
	end
	else begin
	cs1<=1;
                cs2<=1;
                cs3<=1;
                cs4<=1;
                end
end
endmodule


