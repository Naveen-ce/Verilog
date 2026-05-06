module tb;
  reg pclk,presetn,transfer,read_write;
  reg [7:0]write_data;
  reg [7:0]write_paddr;
  reg [7:0]read_paddr;
  wire [7:0] read_data_out;
  wire slave_error;
  wire penable;

top_module dut(.pclk(pclk), .presetn(presetn), .transfer(transfer), .read_write(read_write), .write_data(write_data), .write_paddr(write_paddr), .read_paddr(read_paddr), .read_data_out(read_data_out), .slave_error(slave_error), .penable(penable));

always #5 pclk=~pclk;


task rst(); begin
pclk=0;presetn=1;transfer=0;read_write=0;write_paddr=0;write_data=0;
  #10 presetn=0;
  end
  endtask

  task apb_write;
    input [7:0]addr;
    input [7:0]data;
    begin
      @(posedge pclk);
      transfer=1;
      read_write=1;
      write_paddr=addr;
      write_data=data;
      @(posedge pclk);
      @(posedge pclk);
      @(posedge pclk);
      
      #2
      if(write_paddr==0)
      $display("Operand A=%0d",data);
      
      if(write_paddr==4)
      $display("Operand B=%0d",data);
      
      if(write_paddr==8) begin
      
      case(data)
      
      8'd0:$display("===   Addition   ===");
      8'd1:$display("===   Subtraction   ===");
      8'd2:$display("===   Multiplication   ===");
      8'd3:$display("===   Division   ==="); 
      8'd4:$display("===   AND   ===");
      8'd5:$display("===   OR   ===");
      8'd6:$display("===   NAND   ===");
      8'd7:$display("===   NOR   ===");
      8'd8:$display("===   XOR   ===");
      8'd9:$display("===   XNOR  ===");
      endcase
      end
     
      $display("");
    end
endtask

task apb_read;
  input [7:0]addr;
  begin
    @(posedge pclk);
    transfer=1;
    read_write=0;
    read_paddr=addr;
    @(posedge pclk);
    @(posedge pclk);
    @(posedge pclk);
    #1;

    $display("READ ADDR=%0d | DATA=%0d |  PSLVERR=%b",addr,read_data_out,slave_error);
     $display("");
  end
endtask

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0,tb);
  
    
  $display("================================================================================================");
  $display("                                          APB to ALU                                                 ");
  $display("================================================================================================");
  
  
  rst();


  apb_write(0,10);
  apb_write(4,5);
  apb_write(8,0);
  apb_read(16);
   $display("-----------------------------------");
  $display("");
  
  
  apb_write(8,1);
  apb_read(16);
   $display("-----------------------------------");
  $display("");
  


  apb_write(8,2);
  apb_read(16);
  $display("-----------------------------------");
  $display("");
  

  apb_write(8,3);
  apb_read(16);
  $display("-----------------------------------");
  $display("");
  

  apb_write(8,8);
  apb_read(16);
   $display("-----------------------------------");
  $display("");
  

  
  repeat(5) begin
  apb_write(0,$urandom_range(0,15));
  apb_write(4,$urandom_range(0,15));
  apb_write(8,$urandom_range(0,9));
  apb_read(16);
  $display("-----------------------------------");
  $display("");
  
  end
  
  $finish;
  end

endmodule
