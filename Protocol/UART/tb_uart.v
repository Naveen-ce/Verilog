module tb_uart;
parameter clock_frequency=50000000;
parameter baud_rate=9600;
parameter oversampling=16;
reg clk,rst;
reg [7:0] tx_data;
reg tx_start;
wire [7:0] rx_data_out;
wire rx_done;
wire tx_busy;
wire framing_error;
wire parity_error;

top_module #(.clock_frequency(clock_frequency), .baud_rate(baud_rate), .oversampling(oversampling)) uut(.clk(clk), .rst_n(rst), .tx_data(tx_data), .tx_start(tx_start), .rx_data_out(rx_data_out), .rx_done(rx_done), .tx_busy(tx_busy), .framing_error(framing_error), .parity_error(parity_error));

always #5 clk=~clk;

initial begin

clk=0;rst=1;tx_data=8'b00000000;tx_start=0;
	#20 rst=0;
	#20 tx_data=8'b10101010; tx_start=1;
	#20 tx_start=0;
	#1050000 $finish;
end

initial begin 
	$monitor("Time=%0t | clk=%b | rst=%b | tx_data=%b | tx_start=%b | rx_data_out=%b | rx_done=%b | tx_busy=%b | framing_error=%b | parity_error=%b",$time,clk,rst,tx_data,tx_start,rx_data_out,rx_done,tx_busy,framing_error,parity_error);
	$dumpfile("uart.vcd");
	$dumpvars(0,tb_uart);
end
endmodule


