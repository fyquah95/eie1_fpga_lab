module holder(data, clock, hold, o);
	output reg [15:0] o;
	input [15:0] data;
	
	input hold;
	input clock;
	
	always@(posedge clock) begin
		if(hold == 0) begin
			o = data;
		end 
	end
endmodule