`timescale 1ns / 1ps

module tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] input_x;
	reg sop_x;
	reg valid_x;
	reg eop_x;

	// Outputs
	wire [31:0]output_c;
	wire sop_c;
	wire [31:0]output_Ai;
	wire sop_Ai;
	
	//taking input from X
	reg [31:0]str,str_Ai;
	integer r,n,file,file_Ai;

	// Instantiate the Unit Under Test (UUT)
	top_module uut (
		.clk(clk), 
		.rst(rst), 
		.input_x(input_x), 
		.sop_x(sop_x), 
		.valid_x(valid_x), 
		.eop_x(eop_x), 
		.output_c(output_c), 
		.sop_c(sop_c),
		.sop_Ai(sop_Ai),
		.output_Ai(output_Ai)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		input_x = 0;
		sop_x = 0;
		valid_x = 0;
		eop_x = 0;
		file = $fopen("../Python_Code_Tester/init_x.dat","r");
		file_Ai=$fopen("../Python_Code_Tester/Ai_verilog.dat","w");
		// Wait 100 ns for global reset to finish
		#20;
        rst = 0;
		// Add stimulus here
		#1000000;

	end
	
	always begin
		#10 clk=~clk;
	end
	
	//taking input from x
	
	always @(posedge clk, posedge rst)	begin
		if (rst) begin
		r=0;
		
		end else begin
		sop_x=0;valid_x=0;eop_x=0;
			r=$fgetc(file);
			if (r=="s")	begin
					n = $fscanf(file,"%b\n", str[31:0]);
					sop_x=1;valid_x=1;
					input_x=str;
					end
			else if (r=="v")	begin
					n = $fscanf(file,"%b\n", str[31:0]);
				 	valid_x=1;
					input_x=str;
					end
			else if (r=="e")	begin
					n = $fscanf(file,"%b\n", str[31:0]);
					eop_x =1;valid_x=1;
					input_x=str;
					end
			else if (r=="d")	begin
					n = $fgetc(file);
					end 
			if(sop_Ai==1) begin				
				$fwrite(file_Ai,"%b\n",output_Ai);
			end
			
			if(output_c==1) begin
				$fclose(file_Ai);
			end
			
		end
	end
      
endmodule

