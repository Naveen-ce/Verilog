module tb_sync_dual_port_ram;
parameter width=8;
parameter addrr=6;
parameter depth=64;
reg clk,wr_ena,wr_enb;
reg [addrr-1:0] addra,addrb;
reg [width-1:0] d_ina,d_inb;
wire [width-1:0] d_outa,d_outb;

integer i;

sync_dual_port_ram #(.width(width), .addrr(addrr), .depth(depth)) uut(.clk(clk),
       	.wr_ena(wr_ena), 
       	.wr_enb(wr_enb),
       	.addra(addra),
	.addrb(addrb),
       	.d_ina(d_ina),
      	.d_inb(d_inb),
       	.d_outa(d_outa),
       	.d_outb(d_outb));

always #5 clk=~clk;

reg [width-1:0] golden[0:depth-1];
reg [width-1:0] expecteda,expectedb;

initial begin
	clk=0; addra=0; addrb=0;
        d_ina=8'b00000000; d_inb=8'b00000000;


$display("Writing phase is starting");

	for(i=0;i<50;i=i+1) begin
		wr_ena=1;
		wr_enb=1;
		addra=i;
		addrb=i+1;
		d_ina=i;
                d_inb=i+10;
		golden[addra]=i;
		golden[addrb]=i+10;
		#10;
end

$display("Reading phase is starting");

for(i=0;i<63;i=i+1) begin
	wr_ena=0;
	wr_enb=0;
	addra=i;
	addrb=i+1;
	#10;
end
$finish;
end


always@(posedge clk) begin
	expecteda<=golden[addra];
	 expectedb<=golden[addrb];

if(d_outa == expecteda)
	$display("Ram is working ,Time=%0t | clk=%b |  wr_ena=%b | addra=%d | d_ina=%d | expected_outa=%d | actual_outa=%d",$time,clk,wr_ena,addra,d_ina,expecteda,d_outa);
else
	$display("Ram is not working ,Time=%0t | clk=%b |  wr_ena=%b | addra=%d | d_ina=%d | expected_outa=%d | actual_outa=%d",$time,clk,wr_ena,addra,d_ina,expecteda,d_outa);


if(d_outb == expectedb)
        $display("Ram is working ,Time=%0t | clk=%b | wr_enb=%b | addrb=%d | d_inb=%d | expected_outb=%d | actual_outb=%d",$time,clk,wr_enb,addrb,d_inb,expectedb,d_outb);
else
        $display("Ram is not working ,Time=%0t | clk=%b |  wr_enb=%b | addrb=%d | d_inb=%d | expected_outb=%d | actual_outb=%d",$time,clk,wr_enb,addrb,d_inb,expectedb,d_outb);
end



initial begin
$dumpfile("sync_dual_port_ram.vcd");
$dumpvars(0,tb_sync_dual_port_ram);
end
endmodule
