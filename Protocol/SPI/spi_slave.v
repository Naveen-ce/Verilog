module slave (
input clk,rst,sclk,
output miso,
input mosi,
input [7:0] slave_data_in,
input cs,
output reg slave_done,
output reg [7:0] slave_out);

parameter [1:0] idle=2'b00,
                start=2'b01,
                transfer=2'b10,
                done=2'b11;


reg [1:0] state;
reg [2:0] bit_count;
reg [7:0] slave_shift_reg;

reg [2:0] sclk_sync;
always@(posedge clk or posedge rst) begin
if(rst)
sclk_sync<=3'b000;
else
sclk_sync<=({sclk_sync[1:0],sclk});
end

wire sclk_rising_edge=(sclk_sync[2:1] == 2'b01);


assign miso=(!cs)?slave_shift_reg[7]:1'bz;

always@(posedge clk or posedge rst) begin
	if(rst) begin
             slave_done<=0;
	     state<=0;
     end
     else begin
	     case(state)

		     idle:
		     begin
			     slave_done=0;
			     if(!cs)
				     state<=start;
			     else
				     state<=idle;
		     end

		     start:
	             begin
			     slave_shift_reg<=slave_data_in;
			     bit_count<=0;
			     state<=transfer;
		     end

		     transfer:
		     begin
			     if(sclk_rising_edge) begin
				     
				     slave_shift_reg<=({slave_shift_reg[6:0],mosi});
				     bit_count<=bit_count+1;

				     if(bit_count==3'b110) begin
					     state<=done;
			             end

				     else
					     state<=transfer;
			     end
		     end

                     done:
		     begin
			     slave_done<=1;
			     slave_out<=slave_shift_reg;
			     if(cs)
				     state<=idle;
			     else
				     state<=done;
		     end
		     endcase
	     end
     end
		     endmodule




