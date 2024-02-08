module lfsr10 (
  input wire clk,
  input wire [9:0] count,
  input wire reset,
  input wire confirm,
  output reg [9:0] lfsr
);

	always @(negedge reset or negedge confirm) begin
	  if (~reset) begin
         lfsr <= count; // Initialize the LFSR with a seed value
      end else begin
         lfsr <= lfsr ^ (lfsr << 1) ^ (lfsr << 5); // Example LFSR feedback
      end
	end

endmodule
