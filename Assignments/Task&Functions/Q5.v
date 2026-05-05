//Verilog code that uses different tasks to perform arithmetic operations
module arithmetic_unit(
  input signed [3:0]data1,data2,
  input[2:0]sel_in,
  output reg signed [15:0]out
);
   always @(*) begin
     if(sel_in[2])
          arithmetic_op2(data1,data2,sel_in,out);
      else
          arithmetic_op1(data1,data2,sel_in,out);
   end
  
 task automatic arithmetic_op1(
    input signed [3:0]x,
    input signed [3:0]y,
    input[3:0]s,
    output[15:0]out);
    begin
      case({s[1],s[0]}) 
        2'b00:out=x+y;
        2'b01:out=x-y;
        2'b10:out=x*y;
        2'b11:out=x/y;
        default:out=8'sd0;
      endcase 
    end
  endtask
    task automatic arithmetic_op2(
      input signed [3:0]a,
      input signed [3:0]b,
      input[3:0]s,
      output[15:0]out);
    begin
      case({s[1],s[0]}) 
        2'b00:out=a%b;
        2'b01:out=a+1;
        2'b10:out=a<<2;
        2'b11:out=a<<1;
        default:out=8'sd0;
      endcase 
    end
    endtask

 endmodule

//test bench
module arithmetic_unit_tb();

  reg signed [3:0]data1,data2;
  reg[2:0]sel_in;
  wire signed [15:0] out;
  integer i;
  arithmetic_unit dut(.*);

  initial begin
    $dumpfile("arithmetic_unit.vcd");
    $dumpvars(0,arithmetic_unit_tb);
    $display("            data1     data2         sel     output");
    $monitor("TIME=%0T ||    %B         %B         %B     || %b  ",$time,data1,data2,sel_in,out);
    data1=4'b0111;data2=4'b0110;sel_in=3'b000;
    for(i=0;i<8;i++) begin
      #10
      sel_in=i;
    end
    #10 data1=4'b1001;data2=4'b1010;
    for(i=0;i<8;i++) begin
      #10
      sel_in=i;
    end
    #10 $finish;
  end
endmodule
