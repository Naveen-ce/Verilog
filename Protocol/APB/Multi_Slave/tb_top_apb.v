module tb_apb;
parameter width=8;
parameter depth=256;
reg pclk;
reg presetn;
reg transfer;
reg read_write;
reg [width-1:0] write_paddr;
reg [width-1:0] write_data;
reg [width-1:0] read_paddr;
wire [width-1:0] read_data_out;
wire slave_error;

top_module #(.width(width), .depth(depth)) uut(.pclk(pclk),
	.presetn(presetn),
	.transfer(transfer),
	.read_write(read_write),
	.write_paddr(write_paddr),
	.write_data(write_data),
	.read_paddr(read_paddr),
	.read_data_out(read_data_out),
        .slave_error(slave_error));

always #5 pclk=~pclk;

initial begin
	pclk=0; presetn=1;transfer=0; read_write=0; write_paddr=8'd0; write_data=8'd0; read_paddr=8'd0;
       #10 presetn=0;
       
      //write 
       #10 transfer=1;

       read_write=1; write_paddr=8'd128; write_data=8'd8;

      #30 transfer=0; // fsm to finish write
      
//read

      #20 transfer=1; 

       read_write=0; read_paddr=8'd128; 
     
     #30; transfer=0;
       #20 $finish;

       end

       initial begin
	       $monitor("Time=%0t | pclk=%b | preset=%b | transfer=%b | read_write=%b | write_paddr=%d | write_data=%d | read_paddr=%d | read_data_out=%d | slave_error=%b",$time,pclk,presetn,transfer,read_write,write_paddr,write_data,read_paddr,read_data_out,slave_error);
	       $dumpfile("Apb_multislave.vcd");
	       $dumpvars(0,tb_apb);
       end
       endmodule




