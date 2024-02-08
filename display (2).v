module display(X,HEX,deb);
	input [3:0] X;
	input deb;
	output [7:0] HEX;
	
	
	wire X1,X2,X3,X4;
	wire HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6;
	
	assign HEX = {HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0};
	assign X1 = X[3];
	assign X2 = X[2];
	assign X3 = X[1];
	assign X4 = X[0];
	
	assign HEX0 = (~X1 & ~X2 & ~X3 & X4) | (~X1 & X2 & ~X3 & ~X4) | (X1 & X2 & ~X3 & X4) | (X1 & ~X2 & X3 & X4);
	assign HEX1 = (X3 & ~X4 & X2) | (X3 & X4 & X1) | (~X1 & X2 & ~X3 & X4) | (X1 & X2 & ~X3 & ~X4);
//	assign HEX2 = (~X1 & ~X2 & X3 & ~X4) | (X1 & X2 & X3) | (X1 & X2 & ~X3 & ~X4);
// distributive law
// assign HEX2 = (~X1 & ~X2 & X3 & ~X4) | ((X1 & X2) & ((~X3 & ~X4) + X3));
// absorbtion law 
// assign HEX2 = (~X1 & ~X2 & X3 & ~X4) | ((X1 & X2) & (X4 + X3));
// distribution
	assign HEX2 = (~X1 & ~X2 & X3 & ~X4) | (X1 & X2 & ~X4) | (X1 & X2 & X3);
	assign HEX3 = (X3 & X4 & X2) | (~X1 & X2 & ~X3 & ~X4) | (~X1 & ~X2 & ~X3 & X4) | (X1 & ~X2 & X3 & ~X4);
	assign HEX4 = (~X3 & X4 & ~X2) | (~X1 & X2 & X4) | (~X1 & X2 & ~X3) | (~X1 & ~X2 & X4);
	assign HEX5 = (X3 & X4 & ~X1) | (~X1 & ~X2 & X4) | (~X1 & ~X2 & X3) | (X1 & X2 & ~X3 & X4);
	assign HEX6 = (~X1 & ~X2 & ~X3) | (X1 & X2 & ~X3 & ~X4) | (~X1 & X2 & X3 & X4);
	assign HEX7 = deb;

endmodule