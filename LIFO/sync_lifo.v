module sync_lifo
#(parameter depth=8,width=8)
(input clk,rst,
input push,pop,
input  [width-1:0] data_in,
output reg [width-1:0] data_out,
output  full,empty);

reg [width-1:0] lifo [depth-1:0];

reg [$clog2(depth):0] stack_ptr;

always@(posedge clk or posedge rst)begin
	if(rst) begin
		data_out<=0;
		stack_ptr<=0;
		
	end
else begin
       if(push && !full) begin
	lifo[stack_ptr]<=data_in;
        stack_ptr<=stack_ptr+1;

end

      else if(pop && !empty) begin
	      data_out<=lifo[stack_ptr-1];
              stack_ptr<=stack_ptr-1;
	  
end
end
end

assign empty=(stack_ptr==0);
assign full=(stack_ptr==depth);


endmodule
