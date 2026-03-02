module mealy_fsm(
input clk,rst,a,
output reg q);
parameter [1:0] s0=2'b00,
            s1=2'b01,
            s2=2'b10,
            s3=2'b11;
reg [1:0]state,next_state;
always@(posedge clk or posedge rst)begin
state<=2'b00; 
q<=1'b0;
if(rst)
state<=2'b00;
else
state<=next_state;
end
always@(*) begin
case(state)
s0:begin	
if(a)
next_state<=s1;
else
next_state<=s0;
end
s1:begin
if(a)
next_state<=s1;
else
next_state<=s2;
end
s2:begin
if(a)
next_state<=s3;
else	
next_state<=s0;
end
s3:begin
	if(a)begin
next_state<=s0;
q<=1'b1;
end
else
next_state<=s2;
end
endcase
end
endmodule

		

		   

