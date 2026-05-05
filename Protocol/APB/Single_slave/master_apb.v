module master #(parameter width=8)

(// system to master

input pclk,
input rst,
input transfer,
input read_write,
input [width-1:0] write_paddr,
input [width-1:0] write_data,
input [width-1:0] read_paddr,

// Master to system

output reg [width-1:0] read_data_out,

//Slave to master

input pready,
input [width-1:0] prdata,

// Master to slave

output reg pwrite,
output reg psel1,
output reg penable,
output reg [width-1:0] paddr,
output reg [width-1:0] pwdata);

parameter [1:0] idle=2'b00,
	setup=2'b01,
	access=2'b10;

reg [1:0] state,next_state;


always@(posedge pclk or posedge rst) begin


	if(rst)
	begin
		state<=idle;
		read_data_out<=0;
	pwrite<=0;
       	psel1<=0;
       	penable<=0;
       	paddr<=0;
        pwdata<=0;
end

	else begin
		state<=next_state;
	end

end


always@(*) begin

	case(state)
		idle:
		begin
			if(transfer)
				next_state=setup;
			else
				next_state=idle;
		end

		setup:
		begin
			next_state=access;
		end

		access:
		begin
			if(pready && !transfer)
				next_state=idle;
			else if(pready && transfer)
				next_state=setup;
			else if(!pready)
				next_state=access;
		end
	endcase
end

always@(posedge pclk or posedge rst) begin
if(rst) begin
psel1<=0;
        penable<=0;
        pwrite<=0;
        read_data_out<=0;
	paddr<=0;
        pwdata<=0;
end
else begin
case(state)

idle:
begin
psel1<=0;
penable<=0;
end

setup:
begin
psel1<=1;
penable<=0;
pwrite<=read_write;

if(read_write) begin
	paddr<=write_paddr;
	pwdata<=write_data;
end
else begin
     paddr<=read_paddr;
     end
     end

access:
begin
psel1<=1;
penable<=1;

if(!read_write) begin
	read_data_out<=prdata;
	end
end
endcase
end
end
endmodule


	
