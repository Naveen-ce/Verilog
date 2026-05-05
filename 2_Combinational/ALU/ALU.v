
module full_adder(
input a,b,cin,
output sum,carry);
assign sum=a^b^cin;
assign carry=((a^b)&cin)|(a&b);
endmodule

module full_subtractor(
input a,b,bin,
output diff,borrow);
assign diff =a^b^bin;
assign borrow=(~(a^b)&bin)|(~a&b);
endmodule


module multiplier(
  input [3:0] a,b,
  output [7:0] out);
  assign out=a*b;
endmodule

module alu(
  input [3:0] a,b,
  input [3:0]s,
  output reg [7:0] out);
  
  wire [3:0] c,bo;
  wire [7:0] sum,sub,mul,div,w_and,w_or,w_nand,w_nor,w_xor,w_xnor;
  
  full_adder fa1(.a(a[0]), .b(b[0]), .cin(1'b0), .sum(sum[0]), .carry(c[0]));
  full_adder fa2(.a(a[1]), .b(b[1]), .cin(c[0]), .sum(sum[1]), .carry(c[1]));
  full_adder fa3(.a(a[2]), .b(b[2]), .cin(c[1]), .sum(sum[2]), .carry(c[2]));                                    
  full_adder fa4(.a(a[3]), .b(b[3]), .cin(c[2]), .sum(sum[3]), .carry(c[3]));
                                                              
  assign sum[7:4]=({3'b000,c[3]});
                    
  full_subtractor fs1(.a(a[0]), .b(b[0]), .bin(1'b0), .diff(sub[0]), .borrow(bo[0]));
  full_subtractor fs2(.a(a[1]), .b(b[1]), .bin(bo[0]), .diff(sub[1]), .borrow(bo[1]));
  full_subtractor fs3(.a(a[2]), .b(b[2]), .bin(bo[1]), .diff(sub[2]), .borrow(bo[2]));
  full_subtractor fs4(.a(a[3]), .b(b[3]), .bin(bo[2]), .diff(sub[3]), .borrow(bo[3]));
  
 assign sub[7:4]=4'b0000;

  multiplier m(.a(a), .b(b), .out(mul));
                                                                          
assign w_and={4'b000,a&b}; 
assign w_or={4'b000,a|b};                                                                          
assign w_nand={4'b000,~(a&b)}; 
assign w_nor={4'b000,~(a|b)};                                                                          
assign w_xor={4'b000,a^b};                                                                          
assign w_xnor={4'b000,~(a^b)}; 
                                                                          
                                                                          
always@(*)begin
 case(s)
4'd0:out=sum;
4'd1:out=sub;
4'd2:out=mul;
4'd3:out=(a/b);
4'd4:out=w_and;
4'd5:out=w_or;
4'd6:out=w_nand;
4'd7:out=w_nor;
4'd8:out=w_xor;
4'd9:out=w_xnor;
 default:out=8'd0;
 endcase
 end
                                                                          
endmodule
                                                                          

                                                                                             
                    
                    
                                                              
  
