module tb;
parameter width=8,depth=64,address=6;
reg clk;
reg [width-1:0]data_a,data_b;
reg [address-1:0]addr_a,addr_b;
reg we_a,we_b;
wire [width-1:0]q_a,q_b;
dual #(.width(width),.depth(depth),.address(address)) uut(
	.clk(clk),
	.data_a(data_a),
	.data_b(data_b),
	.addr_a(addr_a),
	.addr_b(addr_b),
	.we_a(we_a),
	.we_b(we_b),
	.q_a(q_a),
	.q_b(q_b));

always #5 clk = ~clk;
integer i;
reg [width-1:0] golden [depth-1:0];
reg [width-1:0] expected_a,expected_b;
initial begin
clk=0;
we_a=0;we_b=0;
data_a=0;data_b=0;
addr_a=0;addr_b=0;
// write
for(i=0;i<depth;i=i+1)
begin
we_a=1;
we_b=1;

addr_a=i;
addr_b= (i+1)%depth;

data_a= i+5;
data_b=i+10;

golden[i]=i+5;
golden[i+1] =i+10;
#10;
end

//read
for(i=0;i<depth;i=i+1)
begin
we_a=0;
we_b=0;

addr_a=i;
addr_b=(i+1)%64;
#10;
end
$finish;
end

always @(posedge clk)
begin
	expected_a = golden[i];
	expected_b = golden[i+1];

if(expected_a == q_a)
	$display("**Ram is working**|Time=%0t|clk=%b|we_a=%d|data_a=%d|addr_a=%d|expected=%d|actual=%d",$time,clk,we_a,data_a,addr_a,expected_a,q_a);
else
	$display("Ram is not working|Time=%0t|clk=%b|we_a=%d|data_a=%d|addr_a=%d|expected=%d|actual=%d",$time,clk,we_a,data_a,addr_a,expected_a,q_a);
if(expected_b == q_b)
        $display("**Ram is working**|Time=%0t|clk=%b|we_b=%d|data_b=%d|addr_b=%d|expected=%d|q_b=%d",$time,clk,we_b,data_b,addr_b,expected_b,q_b);
else
        $display("Ram is not working|Time=%0t|clk=%b|we_b=%d|data_b=%d|addr_b=%d|expected=%d|q_b=%d",$time,clk,we_b,data_b,addr_b,expected_b,q_b);

end


initial begin
	$dumpfile("ram.vcd");
	$dumpvars(0,tb);
end

endmodule
