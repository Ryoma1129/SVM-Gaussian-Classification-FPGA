module top_module(
	 input  clk,rst,
	 input  [31:0]input_x,
	 input  sop_x,valid_x,eop_x,
	 output [31:0]output_c,
	 output sop_c,
	 output sop_Ai,
	 output output_Ai
    );
	 
	 //GLOBAL net,reg 
	 wire clk,rst;
	 wire [31:0]input_x;
	 wire	sop_x,valid_x,eop_x;
	 wire	[31:0]output_c;
	 wire	sop_c;
	 
	 //part_1 net,reg
	 wire	[31:0]output_Ai;
	 wire	sop_Ai;
	 wire	done_x;
	 //instantiating part_1
	 part_1 part1(
		.clk(clk), 
		.rst(rst), 
		.input_x(input_x), 
		.sop_x(sop_x),
		.valid_x(valid_x),
		.eop_x(eop_x),
		.output_Ai(output_Ai), 
		.sop_Ai(sop_Ai),
		.done_x(done_x)
		);
		
	part_2	part2(
		.clk(clk),
		.rst(rst),
		.output_Ai(output_Ai),
		.sop_Ai(sop_Ai),
		.output_c(output_c),
		.sop_c(sop_c)
	);
	 


endmodule
