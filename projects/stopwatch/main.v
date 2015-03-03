module main(clock, display, button0, button1, button2);
	wire tick;
	wire is_reset;
	wire [15:0] o;
	wire [15:0] data;
	
	input button0;
	input button1;
	input button2;
	input clock;
	output [28:0] display;
	
	ticker t1(.clk(clock), .reset(0), .o(tick));
	
	holder(.data(data), .clock(clock), .hold(!button2), .o(o));
	srlatch(.set(!button1), .reset(!button0), .clock(clock), .q(is_reset));

	bcd_counting_block bcd1(.clk(tick), .o(data), .reset(is_reset));
	
	decode_7segment d1(.decimal(o[3:0]), 	.display(display[6:0]));
	decode_7segment d2(.decimal(o[7:4]), 	.display(display[13:7]));
	decode_7segment d3(.decimal(o[11:8]), 	.display(display[20:14]));
	decode_7segment d4(.decimal(o[15:12]), .display(display[27:21]));
	assign display[28] = 0;
endmodule