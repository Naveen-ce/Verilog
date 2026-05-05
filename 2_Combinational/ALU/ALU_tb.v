
module ALU_4bit_tb();
  reg [3:0]a,b;
  reg [3:0]s;
  wire [7:0]out;
  integer i,j;
  alu dut(.*);
  initial begin
    for (i=0;i<9;i=i+1) begin
      s=i+0;
      for(j=0;j<20;j=j+1) begin
        a=i+1;
        b=j;
          
      #10;
    end
    end
  end
  initial begin
    $dumpfile("ALU_4bit.vcd");
    $dumpvars(1, ALU_4bit_tb);
    $monitor("time=%0t  s=%b  a=%b  b=%b  out=%b",$time,s,a,b,out);
  end
endmodule
