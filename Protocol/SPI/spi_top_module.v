`include"spi_master.v"
`include"spi_slave.v"
`include"decoder.v"




module top_module #(parameter clk_frequency=10000000,spi_clk_freq=1000000)
( input clk,rst,

input [7:0] master_data_in,
input tx_start,
input [1:0] target_slave,
output [7:0] master_out,
output master_done,

input [7:0] slave_data_in,
output reg [7:0]  slave_out,
output reg slave_done);


wire master_active;

wire sclk;
wire miso,mosi;
wire master_done_n;
wire [7:0] master_out_n;


wire cs1;
wire cs2;
wire cs3;
wire cs4;

wire miso1,miso2,miso3,miso4;

wire [7:0] slave_out_1,slave_out_2,slave_out_3,slave_out_4;
wire slave_done_1,slave_done_2,slave_done_3,slave_done_4;


decoder d1(.clk(clk), .rst(rst), .enable(master_active), .slave_select(target_slave), .cs1(cs1), .cs2(cs2), .cs3(cs3), .cs4(cs4));

slave s1(.clk(clk), .rst(rst), .sclk(sclk), .miso(miso1), .mosi(mosi),  .slave_data_in(slave_data_in), .cs(cs1), .slave_done(slave_done_1), .slave_out(slave_out_1));

slave s2(.clk(clk), .rst(rst), .sclk(sclk), .miso(miso2), .mosi(mosi), .slave_data_in(slave_data_in), .cs(cs2), .slave_done(slave_done_2), .slave_out(slave_out_2));

slave s3(.clk(clk), .rst(rst), .sclk(sclk), .miso(miso3), .mosi(mosi), .slave_data_in(slave_data_in), .cs(cs3), .slave_done(slave_done_3), .slave_out(slave_out_3));

slave s4(.clk(clk), .rst(rst), .sclk(sclk), .miso(miso4), .mosi(mosi), .slave_data_in(slave_data_in), .cs(cs4), .slave_done(slave_done_4), .slave_out(slave_out_4));

master #(.clk_frequency(clk_frequency), .spi_clk_freq(spi_clk_freq)) m1 (.clk(clk), .rst(rst), .miso(miso), .mosi(mosi), .master_data_in(master_data_in), .start_tx(tx_start), .transmitting(master_active), .master_done(master_done_n), .master_out(master_out_n), .sclk_out(sclk));

always@(*) begin
	case(target_slave)
          2'b00:
	  begin
          slave_out=slave_out_1;
          slave_done=slave_done_1;
           end

          2'b01:
          begin
          slave_out=slave_out_2;
          slave_done=slave_done_2;
           end
          
          2'b10:
	  begin
          slave_out=slave_out_3;
          slave_done=slave_done_3;
           end

          2'b11:
          begin
          slave_out=slave_out_4;
          slave_done=slave_done_4;
           end
	   
	   default:begin slave_out=8'b00000000;
	                 slave_done=0;
		 end
	 endcase
 end
	          
assign master_done=master_done_n;
assign master_out=master_out_n;
assign miso= (!cs1)?miso1:
             (!cs2)?miso2:
             (!cs3)?miso3:
             (!cs4)?miso4:1'b0;
endmodule
