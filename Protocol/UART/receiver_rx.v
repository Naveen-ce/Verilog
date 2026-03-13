module receiver (input clk,rst,
                input rx_in,
                input s_tick,
	output reg [7:0] rx_data_out,
        output reg rx_done,
        output reg framing_error,
        output reg parity_error);

parameter [2:0] idle=3'b000,
	        start=3'b001,
		data=3'b010,
		parity=3'b011,
		stop=3'b100;


reg [2:0] state;
reg [3:0] count;
reg [2:0] bit_count;
reg [7:0] rx_shift_register;
reg received_parity;

always@(posedge clk or posedge rst) begin
	if(rst) begin
		count<=0;
		bit_count<=0;
		state<=0;
		rx_done<=0;
		framing_error<=0;
		parity_error<=0;
	end

else begin
	case(state)

		idle:
		begin
			if(rx_in==0) begin
				state<=start;
				count<=0;
				bit_count<=0;
		        end
		end

		start:
		begin
		if(s_tick) begin
			if(count==4'b1111) begin
				if(rx_in==0)
					state<=data;
				else
					state<=idle;
			end
			else
				count<=count+1;
		end
		end

		data:
		begin
		if(s_tick) begin
			if(count==4'b1111) begin
	              	      rx_shift_register <=({rx_in,rx_shift_register[7:1]});
	
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
		if (s_tick) begin
                    if (count==4'b1111 ) begin
                        received_parity <= rx_in; 
                        state <= stop;
                       count <= 0;
                    end
		    else 
			    count <= count + 1;
                end
                end

		stop:
		begin
		if(s_tick) begin
			if(count==4'b1111) begin
				count<=0;

				if(rx_in==1) begin
			           rx_done<=1;
				   rx_data_out<=rx_shift_register;
				   parity_error<=(received_parity != (^rx_shift_register));
				   state<=idle;
			        end
				else begin
				framing_error<=1;
				state<=idle;
				end
		         end
		         else 	 
	                 count<=count+1;
	 end
	 end
	 endcase
	 end
 end
	 endmodule

                         

