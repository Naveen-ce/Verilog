

`include "clk_divider.v"


module master #(parameter clk_frequency=100000000,spi_clk_freq=1000000)
       (input clk,rst,
                input miso,
                output mosi,
	       input [7:0] master_data_in,
               input start_tx,
               input misoi,
	       output reg transmitting,
               output reg master_done,
               output reg [7:0] master_out,
               output sclk_out);

parameter [1:0] idle=2'b00,
                start=2'b01,
                transfer=2'b10,
                done=2'b11;

clk_divider #(.clk_frequency(clk_frequency), .spi_clk_freq(spi_clk_freq)) c1(.clk(clk), .rst(rst), .sclk(sclk));

reg [1:0] state;
reg [7:0] master_shift_reg;
reg [2:0] bit_count;
wire sclk;
assign sclk_out=sclk;

reg sclk_prev;
always@(posedge clk or posedge rst) begin
	if(rst)
		sclk_prev<=0;
	else
		sclk_prev<=sclk;
end


wire sclk_rising_edge=(sclk==1'b1) && (sclk_prev==1'b0);


assign mosi=master_shift_reg[7];

	always@(posedge clk or posedge rst)begin
		if(rst) begin
			state<=0;
			master_done<=0;
			transmitting<=0;
		end
		else begin
			case(state)

				idle:
				begin
				        
					master_done<=0;
					if(start_tx)begin
					       transmitting<=1;	
						state<=start;
					end
					else 
						state<=idle;
				end

				start:
				begin
				        
					master_shift_reg<=master_data_in;
					bit_count<=0;
					state<=transfer;

				end

				transfer:
				begin
					if(sclk_rising_edge) 
					begin
						        master_shift_reg<=({master_shift_reg[6:0],miso});
						bit_count<=bit_count+1;
					    if(bit_count==3'b111) 
						    state<=done;
					    else 
						    state<=transfer;
				        end
				end

				done:
				begin
					transmitting<=0;
					master_done<=1;
					master_out<=master_shift_reg;
					state<=idle;
				end
			endcase
			end
		end


		endmodule

					


					


