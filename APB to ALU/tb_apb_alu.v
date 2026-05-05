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
    #1;
    $display("READ ADDR=%0d DATA=%0d PSLVERR=%b",addr,read_data_out,slave_error);
  end
endtask

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0,tb);
  
  rst();
  
  apb_write(0,10);
  apb_write(4,5);
  apb_write(8,0);
  apb_read(16);
  
  apb_write(8,1);
  apb_read(16);

  apb_write(8,2);
  apb_read(16);

  apb_write(8,3);
  apb_read(16);

  apb_write(8,8);
  apb_read(16);

  #50 $finish;
  end

initial begin
  $monitor("T=%0t |  PRESETN=%b |  PENABLE=%b |  WRITE_PADDR=%0d |  WRITE_DATA=%0d |  READ_PADDR=%0d |  READ_DATA=%0d |  PSLVERR=%b",$time,presetn,penable,write_paddr,write_data,read_paddr,read_data_out,slave_error);
  end

endmodule
