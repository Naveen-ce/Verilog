module transmitter(input clk,rst,
	input [7:0] tx_data,
	input tx_start,
	input s_tick,
        output reg tx_out,
        output reg tx_busy,
	output reg tx_done
        );
parameter [2:0] idle=3'b000,
	        start=3'b001,
		data=3'b010,
		parity=3'b011,
		stop=3'b100;
reg [3:0] count;
reg [2:0] bit_count;
reg [2:0] state;
reg [7:0] shift_register;
reg parity_bit;




always@(posedge clk or posedge rst) begin
	if(rst) begin
		state<=idle;
		count<=0;
		bit_count<=0;
		tx_out<=1;
		tx_busy<=0;
		tx_done<=0;
	end
	
else begin
	case(state) 
idle:
begin
tx_out<=1;
if(tx_start) begin
state<=start;
tx_busy<=1;
shift_register<=tx_data;
parity_bit<=^tx_data;
count<=0;
end
end

start:
begin
tx_out<=0;
if(s_tick) begin
if(count==4'b1111)begin
	state<=data;
        count<=0;
        bit_count<=0;
end
else
	count<=count+1;
end
end

data:
begin
	tx_out<=shift_register[0];
	if(s_tick) begin
	if(count==4'b1111) begin
		shift_register<=(shift_register[7:0]>>1);
	        count<=0;
	if(bit_count==3'b111) 
		state<=stop;
	else begin
                 state<=data;
                 bit_count<=bit_count+1;
                 end
                 end
	 else
		 count<=count+1;
   end
 end

                parity:
	        begin
	        tx_out<=parity_bit;
	        if(s_tick) begin
	        if(count==4'b1111)begin
	        state<=stop;
	        count<=0;
	        end
	        else
	        count<=count+1;
	        end
	        end

 stop:
 begin
 tx_out=1;
 if(s_tick) begin
 if(count==4'b1111) begin
	tx_done<=1;
        state<=idle;
        tx_busy<=0;
end
 else
   count<=count+1;
end
end
endcase
end
end

endmodule


		


