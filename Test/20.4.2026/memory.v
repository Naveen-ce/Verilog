module memory(
input [7:0] data_in,
output [7:0] sum,
output [7:0] large);

reg [7:0] mem [13:0];

function memo(input [7:0] d_in) begin

