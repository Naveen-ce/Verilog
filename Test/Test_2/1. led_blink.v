module led_blink(
input clk,rst,
output led);

reg [24:0] count;

always@(posedge clk) begin

if(rst)
count<=25'b0;

else if(count==24_999_999) begin
	count<=25'b0;
	led<=~led;
end

else
	count<=count+1'b1;
end
endmodule

