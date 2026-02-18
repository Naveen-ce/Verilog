module fork_join; 
reg [3:0] x;
initial begin
x = 4'b0011;
fork
#5 x = x + 1;
#10 x = x + 2;
join
end
initial begin
$monitor("Time=%0t | x=%b",$time,x);
end
endmodule

