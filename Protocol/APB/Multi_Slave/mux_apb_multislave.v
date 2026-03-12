module mux(
input psel0,psel1,psel2,psel3,
input [7:0] prdata0,prdata1,prdata2,prdata3,
input pready0,pready1,pready2,pready3,
output [7:0] prdata,
output pready);

assign prdata=psel0?prdata0:
       psel1?prdata1:
       psel2?prdata2:
       psel3?prdata3:0;
       
assign pready=psel0?pready0:
       psel1?pready1:
       psel2?pready2:
       psel3?pready3:0;

endmodule
