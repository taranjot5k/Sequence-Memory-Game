module displayLetters(letter,HEX);
	input [0:7] letter;
	output [7:0] HEX;
	
	assign HEX = letter;
	
endmodule