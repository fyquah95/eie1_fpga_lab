module srlatch(set, reset, clock, q);
	output reg q;
	input reset;
	input set;
	input clock;
	
	always@(posedge clock) begin
		if(set == 1) begin
			q = 1;
		end else if (reset == 1) begin
			q = 0;
		end
	end
endmodule