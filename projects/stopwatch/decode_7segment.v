module decode_7segment (decimal, display);
  input [3:0] decimal;
  output [6:0] display;
	
	assign display[0] = ~(decimal[1] | decimal[3] | (decimal[2] & decimal[0]) | (~decimal[2] & ~decimal[0]));
	assign display[1] = ~((~decimal[1] & ~decimal[0]) | (decimal[1] & decimal[0]) | ~decimal[2]);
	assign display[2] = ~(decimal[0] | ~decimal[1] | decimal[2] | decimal[3]);
	assign display[3] = ~(decimal[3] | (~decimal[0] & decimal[1]) | (decimal[0] & ~decimal[1] & decimal[2]) | (~decimal[0] & ~decimal[2]) | (decimal[1] & ~decimal[2]));
	assign display[4] = ~((~decimal[0] & ~decimal[2]) | (~decimal[0] & decimal[1]));
	assign display[5] = ~((~decimal[0] & ~decimal[1]) | (decimal[2] | decimal[3]));
	assign display[6] = ~(decimal[3] | (decimal[2] & ~decimal[1]) | (decimal[1] & ~decimal[2]) | (decimal[1] & ~decimal[0]));

endmodule