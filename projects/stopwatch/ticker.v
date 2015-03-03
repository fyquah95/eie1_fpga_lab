module ticker(count, clk, reset, o);
	input clk;
	input reset;
	output reg o;
	output reg [18:0] count;

	always@(posedge clk) begin
		if(count == 19'b1111010000100100000) begin
			count = 0;
			o = 1;
		end else begin
			count = count + 1;
			o = 0;
		end
	end
endmodule