module shift(
input clk,rst,shift_in,
output [3:0] led);

reg [24:0] count;

always@(posedge clk or posedge rst) begin

	if(reset) begin
		led<=4'b0000;
		count<=25'b0;
	end

	else if(count==24_999_999) begin
		count<=25'b0;
		led<={led[2:0],shift_in};
	end

	else
		count<=count+1'b1;
end
endmodule
