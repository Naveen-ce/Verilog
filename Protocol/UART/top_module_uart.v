`include "baud_rate_generator.v"
`include "transmitter_tx.v"
`include "receiver_rx.v"



module top_module #(
                  parameter clock_frequency=50000000,
		  parameter baud_rate=9600,
		  parameter oversampling=16)
(input clk,rst_n,
        input [7:0] tx_data,
        input tx_start,
        output [7:0] rx_data_out,
        output rx_done,
        output tx_busy,
        output framing_error,
        output parity_error);

wire s_tick;
wire  tx_out;
wire tx_busy_n;
wire [7:0] rx_data_out_n;
wire framing_error_n;
wire parity_error_n;
wire rx_done_n;

baud_rate_generator #(.clock_frequency(clock_frequency), .baud_rate(baud_rate), .oversampling(oversampling)) b1(.clk(clk), .rst(rst_n), .s_tick(s_tick));

transmitter t1(.clk(clk), .s_tick(s_tick), .rst(rst_n), .tx_data(tx_data), .tx_start(tx_start), .tx_out(tx_out), .tx_busy(tx_busy_n));

receiver r1 (.clk(clk), .s_tick(s_tick), .rst(rst_n), .rx_in(tx_out), .rx_data_out(rx_data_out_n), .rx_done(rx_done_n), .framing_error(framing_error_n), .parity_error(parity_error_n));

assign rx_data_out=rx_data_out_n;
assign rx_done=rx_done_n;
assign tx_busy=tx_busy_n;
assign framing_error=framing_error_n;
assign parity_error=parity_error_n;
endmodule
