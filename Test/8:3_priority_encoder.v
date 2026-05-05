module priority_encoder(
input [7:0]d,
output reg[2:0]q);
always@(*)begin
casez(d)
8'b00000000:q<=3'bxxx;
8'b00000001:q<=3'b000;
8'b0000001z:q<=3'b001;
8'b000001zz:q<=3'b010;
8'b00001zzz:q<=3'b011;
8'b0001zzzz:q<=3'b100;
8'b001zzzzz:q<=3'b101;
8'b01zzzzzz:q<=3'b110;
8'b1zzzzzzz:q<=3'b111;
default:$display("INVALID");
endcase
end
endmodule
