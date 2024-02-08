/*
	EECS 3201
	12/5/2023
	Groups (B/N)
	Andrew Tissi
	Elyse Dhaliwal
	Gurkirat Bindra
	Taranjot Kalkat
*/

module project(SW, cout1, cout2, LEDR, KEY, HEX0,HEX2,HEX3,HEX5, clockcount);
	input [1:0] KEY;
	input [9:0] clockcount;
	output [9:0] LEDR;
	output [7:0] HEX0,HEX2,HEX3,HEX5;
	input [9:0] SW;
	input cout1, cout2;

	//create the letters P and F
	reg [7:0] _P = 8'b10001100;
	reg [7:0] _F = 8'b10001110;
	reg [7:0] _NONE = 8'b11111111;
  
	//start and confirm buttons
	reg startbuttonvalue = 0;
	reg confirmbuttonvalue = 0;
  	wire s = startbuttonvalue;
	wire c = confirmbuttonvalue;
	wire start = KEY[0];
	wire confirm = KEY[1];
	
	//which item in the sequence that the player is guessing
	reg [3:0] confirm_level = 0; 
	wire [3:0] conlvl; 
	assign conlvl = confirm_level;
	
	//the level of the player
	reg [3:0] player_level = 0; 
	wire [3:0] plrlvl; 
	assign plrlvl = player_level;
	
	reg [9:0] lr = 10'b0000000000; //reg will hold the value of what is being displayed on the leds
	
	//the number of the sequence
	reg [3:0] count = 0; 
	wire [3:0] cnt1; 
	assign cnt1 = count;
	
	//displays pass or fail
	reg [7:0] Display3 = 8'b11111111;
	wire [7:0] d3; 
	assign d3 = Display3;
	displayLetters display_instance4 (d3, HEX3);
	
	//displays for the count, player level, and confirm level
	display display_instance0 (cnt1, HEX0, 1);
	display display_instance1 (plrlvl, HEX5, 1);
	display display_instance3 (conlvl, HEX2, 1);
	
	reg [9:0] levels [15:0]; //array that holds each level
  
	always @(posedge cout1) begin //on the clock
		if (s) begin
			if (count <= player_level && confirm_level == 0) begin //reading through the levels when the player is not confirming their choices
				lr = levels[count];
				count = count + 1; //goes to next display
			end
		
			else begin //once it reaches the end of the sequence that the player should see it goes back to the start
				count = 0;
				lr = 10'b0000000000;
			end
		end
	end

	always @(negedge start) begin // starts the game once only
		startbuttonvalue = 1;
		
		//gets a random 10 bit count from the clock then makes a pesudo random sequence of 16 total 10 bit levels
		levels[0] = clockcount;
		levels[1] = levels[0] ^ (levels[0] << 1) ^ (levels[0] << 5);
		levels[2] = levels[1] ^ (levels[1] << 1) ^ (levels[1] << 5);
		levels[3] = levels[2] ^ (levels[2] << 1) ^ (levels[2] << 5);
		levels[4] = levels[3] ^ (levels[3] << 1) ^ (levels[3] << 5);
		levels[5] = levels[4] ^ (levels[4] << 1) ^ (levels[4] << 5);
		levels[6] = levels[5] ^ (levels[5] << 1) ^ (levels[5] << 5);
		levels[7] = levels[6] ^ (levels[6] << 1) ^ (levels[6] << 5);
		levels[8] = levels[7] ^ (levels[7] << 1) ^ (levels[7] << 5);
		levels[9] = levels[8] ^ (levels[8] << 1) ^ (levels[8] << 5);
		levels[10] = levels[9] ^ (levels[9] << 1) ^ (levels[9] << 5);
		levels[11] = levels[10] ^ (levels[10] << 1) ^ (levels[10] << 5);
		levels[12] = levels[11] ^ (levels[11] << 1) ^ (levels[11] << 5);
		levels[13] = levels[12] ^ (levels[12] << 1) ^ (levels[12] << 5);
		levels[14] = levels[13] ^ (levels[13] << 1) ^ (levels[13] << 5);
		levels[15] = levels[14] ^ (levels[14] << 1) ^ (levels[14] << 5);
	end
  
  //user presses the confirm button
  always @(negedge confirm) begin
		Display3 = 8'b11111111;
		
		//the user guesses correctly
		if (levels[confirm_level] == SW) begin 
			confirm_level = confirm_level + 1; //move to the next item in the sequence
			if (confirm_level == player_level+1) begin //user guessed the final item in the sequence correctly
				Display3 = _P;//display a P for Pass
				player_level = player_level+1; //go to the next level
				confirm_level = 0; // reset the confirm
			end
		end
		
		//the user guesses wrong
		else begin 
			//reset their level and display an F for fail
			player_level = 0; 
			confirm_level = 0;
			Display3 = _F;
		end
  end

  
  assign LEDR = lr; //turn on the LEDS corresponding to what is stored in the registers
endmodule
