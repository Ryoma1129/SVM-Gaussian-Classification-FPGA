module part_1(
	input		clk,rst,
	input		[31:0]input_x,
	input		sop_x,valid_x,eop_x,
	output	[31:0]output_Ai,
	output	sop_Ai,
	output	done_x
    );
	
	//Input Output declaration

	
	//net,reg
	wire		clk,rst;
	wire		[31:0]input_x;
	wire		sop_x,valid_x,eop_x;
	wire		[31:0]output_Ai;
	wire		sop_Ai;
	reg		done_x;

	
	//TOO SLOW! 

	integer	index;
	reg		x_coming;
	wire		[7:0]address_x;
	wire		[31:0]data_out_x;
	reg		[31:0]data_x;
	reg		[31:0]data_in_x;
	reg		we_x;
	//register_file/array to store x
	//putting in the Z data containing block RAM
	ram_x ram_x1(
		.address(address_x), // Address input
		.clk(clk),
		.data_out(data_out_x),			// Data output
		.qin(data_in_x),		// Data input
		.we(we_x));

	//data in x is coming mechanism
	always @(posedge clk, posedge rst)
	begin
		if (rst) begin
		x_coming<=1'b0;
		end else if (sop_x) begin
		x_coming<=1'b1;
		end else if (eop_x) begin
		x_coming<=1'b0;
		end	
	end	
	//to store the data_x in array_x
	always @(posedge clk, posedge rst)
	begin
		if (rst) begin
		index <= 0; 
		we_x<=0;
		end else if (sop_x) begin
		data_in_x <=
		{input_x[31:24],input_x[23:16],input_x[15:8],input_x[7:0]};
		we_x<=1;
		end else if (x_coming && valid_x) begin
		data_in_x <=
		{input_x[31:24],input_x[23:16],input_x[15:8],input_x[7:0]};
		index<=index+1;
			if (index==224) begin
			index<=0;
			end
		end else begin
		we_x<=0;index<=0;
		end
	end

	
	assign address_x = (we_x) ? index:x_mod225;
	
	
		
	//counter to manage the things from here
	integer		counter;
	reg			[17:0]address_z;//address_z=svm_i*225+z_j;
	reg			[9:0]svm_i,z_j;
	wire			[31:0]data_out_z;
	reg			[31:0]data_z;
	
	supply0 we;
	supply0 [31:0]qin;
		//putting in the Z data containing block RAM
	ram ram_z(
		.address(address_z), // Address input
		.clk(clk),
		.data_out(data_out_z),			// Data output
		.qin(qin),		// Data input
		.we(we)	);
	

	//1.B things
	reg			[7:0]lut_in1,lut_in2,lut_in3,lut_in4;
	
	

	//route x_j and z_i_j to modulus
		//to get value out of array_x
	integer x_mod225;
	always @(posedge clk, posedge rst)
	begin
		if (rst) begin
		counter<=-1;
		address_z<=20'b00000000000000000000;
		svm_i<=10'b0000000000;
		z_j<=10'b0000000000;
		x_mod225<=0;
		lut_in1<=0;lut_in2<=0;lut_in3<=0;lut_in4<=0;
		end else if (eop_d[0]) begin 		//address_z=0;address_x=0;
													//data_out_z=~,data_out_x=~
													//data_z=~,data_x=~
		end else if (eop_d[1]) begin 		//address_z=1;address_x=1;
		x_mod225<=x_mod225+1;		  		//data_out_z=[0],data_out_x=[0]
		address_z<=address_z+1;		  		//data_z=~,data_x=~
		z_j<=z_j+1;				  
		end else if (eop_d[2]) begin 		//address_z=2;address_x=2;
		x_mod225<=x_mod225+1;		  		//data_out_z=[1],data_out_x=[1]
		address_z<=address_z+1;		 		//data_z=[0],data_x=[0]
		z_j<=z_j+1;						//gt=~,sr=~
		counter<=0;
		end else if (counter>=0) begin
			
			lut_in1<=gt1-sr1;
			lut_in2<=gt2-sr2;
			lut_in3<=gt3-sr3;
			lut_in4<=gt4-sr4;
			
			if (x_mod225==224) begin
			x_mod225<=0;
			end else begin
			x_mod225<=x_mod225+1;
			end
			
			address_z<=address_z+1;
			
			if (z_j==224) begin
			z_j<=0;
				if (svm_i==628) begin
				svm_i<=0;
				end else begin
				svm_i<=svm_i+1;
				end
			end else begin
			z_j<=z_j+1;
			end
			
			case (counter) 
				1: begin		counter<=2;address_z<=0;x_mod225<=0;z_j<=0;  end
				2: begin		counter<=3;address_z<=0;x_mod225<=0;z_j<=0;  end
				3: begin		counter<=-2;address_z<=0;x_mod225<=0;z_j<=0; end
				default:    begin
									if (address_z==141524) begin
									counter<=counter+1;address_z<=0;x_mod225<=0;z_j<=0;
									end
								end
			endcase
			
		end else begin
		lut_in1<=0;lut_in2<=0;lut_in3<=0;lut_in4<=0;
		end
	
	end
	
	
	
	//gt,sr;		eop_d;	data_z/x,data_out_z/x
	reg	[7:0]gt1,gt2,gt3,gt4;
	reg	[7:0]sr1,sr2,sr3,sr4;
	reg	[4:0]eop_d;
	always@(posedge clk,posedge rst)
	begin
		if (rst) begin
		gt1<=0;gt2<=0;gt3<=0;gt4<=0;
		sr1<=0;sr2<=0;sr3<=0;sr4<=0;
		data_x<=0;data_z<=0;
		eop_d<=2'b00;
		end else begin 
			if(data_z[7:0]>data_x[7:0]) begin
			gt1<=data_z[7:0];sr1<=data_x[7:0];
			end else begin
			gt1<=data_x[7:0];sr1<=data_z[7:0];
			end
			
			if(data_z[15:7]>data_x[15:7]) begin
			gt2<=data_z[15:7];sr2<=data_x[15:7];
			end else begin
			gt2<=data_x[15:7];sr2<=data_z[15:7];
			end
			
			if(data_z[23:15]>data_x[23:15]) begin
			gt3<=data_z[23:15];sr3<=data_x[23:15];
			end else begin
			gt3<=data_x[23:15];sr3<=data_z[23:15];
			end
			
			if(data_z[31:24]>data_x[31:24]) begin
			gt4<=data_z[31:24];sr4<=data_x[31:24];
			end else begin
			gt4<=data_x[31:24];sr4<=data_z[31:24];
			end
			
			data_x<=data_out_x;
			data_z<=data_out_z;
			
			eop_d[0]<=eop_x;
			eop_d[1]<=eop_d[0];eop_d[2]<=eop_d[1];
			eop_d[3]<=eop_d[2];eop_d[4]<=eop_d[3];
		end
	end
	
	

//	sending lut-->ai through ai_lut
	ai_lut ai_lut1(.clk(clk),
	.rst(rst), 
	.lut_in1(lut_in1),
	.lut_in2(lut_in2),
	.lut_in3(lut_in3),
	.lut_in4(lut_in4),
	.address_z(address_z),
	.svm_i(svm_i),
	.z_j(z_j),
	.output_Ai(output_Ai),
	.sop_Ai(sop_Ai));
	
	
endmodule
