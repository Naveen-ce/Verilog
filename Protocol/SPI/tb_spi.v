module tb_spi;
parameter clk_frequency=10000000;
parameter spi_clk_freq=1000000;
reg clk;
reg rst;
reg [7:0] master_data_in;
reg tx_start;
reg [1:0] target_slave;
wire [7:0] master_out;
wire master_done;

reg [7:0] slave_data_in;
wire [7:0] slave_out;
wire slave_done;

top_module #(.clk_frequency(clk_frequency), .spi_clk_freq(spi_clk_freq)) uut (.clk(clk), .rst(rst), .master_data_in(master_data_in), .tx_start(tx_start), .target_slave(target_slave), .master_out(master_out), .master_done(master_done), .slave_data_in(slave_data_in), .slave_out(slave_out), .slave_done(slave_done));

always#5 clk=~clk;

initial begin

	clk=0; rst=1; master_data_in=8'b10101010; tx_start=0; slave_data_in=8'b10001111; target_slave=0; 
       #10 rst=0;
#10 master_data_in=8'b10101010; tx_start=1; slave_data_in=8'b10001111; target_slave=0;    
#10 tx_start=0;
#1000 $finish;
end

initial begin
	$monitor("Time=%0t | clk=%b | rst=%b | master_data_in=%b | tx_start=%b | slave_data_in=%b | target_slave=%b | master_out=%b | slave_out=%b |  master_done=%b | slave_done=%b",$time,clk,rst,master_data_in,tx_start,slave_data_in,target_slave,master_out,slave_out,master_done,slave_done);
	$dumpfile("spi.vcd");
	$dumpvars(0,tb_spi);
end
endmodule
