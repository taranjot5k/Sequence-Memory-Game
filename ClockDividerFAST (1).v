module ClockDividerFAST(cin,cout,countout);
	 // Based on (corrected) code from fpga4student.com
	 // cin is the input clock; if from the DE10-Lite,
	 // the input clock will be at 50 MHz
	 // The clock divider toggles cout every 25 million
	 // cycles of the input clock
	 input cin;
	 output reg cout;
	 output [9:0] countout;
	 assign countout = count[9:0];
	 reg[31:0] count; 
	 parameter D = 32'd1250000;//32'd12500000
	 always @(posedge cin) begin
		 count <= count + 32'd1;
		 if (count >= (D-1)) begin
			 cout <= ~cout;
			 count <= 32'd0;
		 end
	 end
endmodule
