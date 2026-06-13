module tb;
 parameter N=5;
  reg clk,rst;
  wire [N-1:0] NS1,NS2,EW1,EW2;
  wire [$clog2(N)-2:0] NS1_P,NS2_P,NS3_P,NS4_P,EW1_P,EW2_P,EW3_P,EW4_P;
  
  always #5 clk=~clk;
  
  traffic_light_ct #(.N(N)) dut (.clk(clk), .rst(rst), .NS1(NS1), .NS2(NS2), .EW1(EW1), .EW2(EW2), .NS1_P(NS1_P), .NS2_P(NS2_P), .NS3_P(NS3_P), .NS4_P(NS4_P), .EW1_P(EW1_P), .EW2_P(EW2_P), .EW3_P(EW3_P), .EW4_P(EW4_P));
  
  initial begin
    
    $display("#=====================================================================================================================#");
    $display("#                                               TRAFFIC LIGHT CONTROLLER                                              #");
    $display("#=====================================================================================================================#");

   clk=0; rst=1; 
    #10;
    rst=0;
    #1085;
    rst=1;
    #10;
    $finish;
    
  end
  
  initial begin
    
    $monitor("| CLK =%b | RST =%b |  NS1 =%b | NS2 =%b | EW1 =%b | EW2 =%b | NS1_P =%b | NS2_P =%b | NS3_P =%b | NS4_P =%b | EW1_P =%b | EW2_P =%b | EW3_P =%b | EW4_P =%b",clk,rst,NS1,NS2,EW1,EW2,NS1_P,NS2_P,NS3_P,NS4_P,EW1_P,EW2_P,EW3_P,EW4_P);
    
    $dumpfile("Traffic_light_controller.vcd");
    $dumpvars(0,tb);
  end
  
endmodule
    
    
    
    

  
  
