module bcd_counting_block(clk, o, reset);
	input clk;
	input reset;
	output reg [15:0] o;

	always@(posedge clk) begin
		if(reset == 0) begin
			o = 0;
		end else begin
			o = o + 1;
		
			if(o[3:0]==4'b1010) begin
				o[3:0] = 0;
				o[7:4] = o[7:4] + 1;
			end
			
			
			if(o[7:4]==4'b1010) begin
				o[11:8] = o[11:8] + 1;
				o[7:4] = 0;
			end
			
			if(o[11:8]==4'b1010) begin
				o[15:12] = o[15:12] + 1;
				o[11:8] = 0;
			end
			
			if(o[15:12] == 4'b1010) begin
				o = 0;
			end
		end
	end
endmodule