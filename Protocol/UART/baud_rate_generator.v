module baud_rate_generator (
input clk,
input rst,
output reg s_tick
);

parameter clock_frequency=50000000;
parameter baud_rate=9600;
parameter oversampling=16;

localparam baud=clock_frequency/(baud_rate*oversampling);
localparam counter_width=9;
reg [counter_width-1:0] count;

always@(posedge clk or posedge rst) begin
if(rst) begin
s_tick<=1'b0;
count<=0;
end
else begin
if(count==(baud-1)) begin
s_tick<=1'b1;
count<=0;
end
else begin
s_tick<=1'b0;
count<=count+1;
end
end
end
endmodule
