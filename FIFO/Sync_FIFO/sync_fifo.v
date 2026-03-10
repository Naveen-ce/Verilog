module sync_fifo
#(parameter depth=8,width=8)
(input clk,rst,
input write_enable,read_enable,
input  [width-1:0] data_in,
output reg [width-1:0] data_out,
output full,empty);

reg [width-1:0] fifo [0:depth-1];

localparam a=$clog2(depth)+1;
reg [a-1:0] write_ptr;
reg [a-1:0] read_ptr;

always@(posedge clk or posedge rst)begin
	if(rst) begin
		data_out<=0;
		write_ptr<=0;
		read_ptr<=0;
	end
else begin
       if(write_enable && !full) begin
	fifo[write_ptr[a-2:0]]<=data_in;
        write_ptr<=write_ptr+1;
end

       if(read_enable && !empty) begin
              data_out<=fifo[read_ptr[a-2:0]];
              read_ptr<=read_ptr+1;
end
      
end
end
assign full=(write_ptr[a-1] != read_ptr[a-1]) && (write_ptr[a-2:0] == read_ptr[a-2:0]);
assign empty= write_ptr==read_ptr;
endmodule
