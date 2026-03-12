module slave_apb #(parameter width=8,depth=256)
(input pclk,
input pwrite,
input rst,
input psel,
input penable,
input [width-1:0] paddr,
input [width-1:0] pwdata,
output reg  pready,
output reg [width-1:0] prdata);

reg [width-1:0] ram[depth-1:0];
integer i;

always@(posedge pclk or posedge rst) begin
if(rst) begin
pready<=1;
prdata<=0;
 for(i=0;i<256;i=i+1)
 ram[i]<=0;
 end
 else begin
 pready<=1;
if(psel && penable) begin

	if(pwrite) 
            ram[paddr]<=pwdata;

    else
	    prdata<=ram[paddr];
  
    end
    end
    end
    endmodule

