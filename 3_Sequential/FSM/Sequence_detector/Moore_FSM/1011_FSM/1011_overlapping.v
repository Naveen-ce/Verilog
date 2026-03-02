module moore_fsm(
input clk,rst,a,
output reg q);
parameter [2:0] s0=3'b000,
            s1=3'b001,
            s2=3'b010,
            s3=3'b011,
            s4=3'b100;
reg [2:0]state,next_state;
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
if(a) 
next_state<=s4;
else 
next_state<=s2;
end
s4:begin
q<=1'b1;	
if(a)
next_state<=s1;
else
next_state<=s2;
end
endcase
end
endmodule

		

		   


