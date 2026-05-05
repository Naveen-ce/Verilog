module decoder #(parameter width=8)
(input [width-1:0] paddr,
input psel_in,
output reg  psel0,psel1,psel2,psel3);

always@(*) begin
psel0=0;
psel1=0;
psel2=0;
psel3=0;
if(psel_in) begin
	case({paddr[7:6]})
            2'b00:psel0=1'b1;
	    2'b01:psel1=1'b1;
	    2'b10:psel2=1'b1;
            2'b11:psel3=1'b1;
	    
    endcase
    end
    end
    endmodule
