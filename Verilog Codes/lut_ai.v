module ai_lut(
	input clk,rst,
	input [7:0]lut_in1,lut_in2,lut_in3,lut_in4,
	input	address_z,
	input	[9:0]svm_i,
	input	z_j,
	output [31:0]output_Ai,
	output sop_Ai
    );

//the I/O of this module (with few helping)
wire		clk,rst;
wire		[7:0]lut_in1,lut_in2,lut_in3,lut_in4;
wire		[17:0]address_z;
reg		[17:0]address_z_delay;
wire		address_z_move;
reg		[9:0]address_z_d;
wire		[9:0]svm_i;
reg		[9:0]svm_i_d1,svm_i_d2;
wire		[9:0]z_j;
wire		[31:0]output_Ai;
reg		sop_Ai;

//the I/O to submodules
wire		[31:0]lut_out1,lut_out2,lut_out3,lut_out4;
wire		[31:0]addout_l1_1,addout_l1_2,addout_l1_3,addout_l1_4;
reg		[31:0]addout_l2_1,addout_l2_2;
reg		[31:0]addout_l3_1,ai_hold;
wire		[31:0]ai;
reg		[31:0]Ai;
supply0	[7:0]qin_ai;
supply0	we_ai;

assign	output_Ai = Ai;
assign	address_z_move = ((z_j==0) && (|address_z)) || (address_z_delay==141524);

always @(posedge clk,posedge rst) begin
	if (rst) begin
	address_z_delay<=0;
	address_z_d<=0;
	svm_i_d1<=0;
	svm_i_d2<=0;
	end else begin
		if (address_z_move) begin
		address_z_d[0]<=1;
		address_z_d[9:1]<=0;
		end else begin
		address_z_d <= address_z_d << 1;
		end
	address_z_delay<=address_z;
	svm_i_d1<=svm_i;
	svm_i_d2<=svm_i_d1;
	end
end

//lookup_table*4
lookup_table table1(.clk(clk),.rst(rst),.lut_in(lut_in1),.lut_out(lut_out1));
lookup_table table2(.clk(clk),.rst(rst),.lut_in(lut_in2),.lut_out(lut_out2));
lookup_table table3(.clk(clk),.rst(rst),.lut_in(lut_in3),.lut_out(lut_out3));
lookup_table table4(.clk(clk),.rst(rst),.lut_in(lut_in4),.lut_out(lut_out4));

//adder_l1*4
adder_l1 adder_l1_1(.clk(clk),.rst(rst),.address_z_d(address_z_d[4]),.d_l1(lut_out1),.q_l1(addout_l1_1));
adder_l1 adder_l1_2(.clk(clk),.rst(rst),.address_z_d(address_z_d[4]),.d_l1(lut_out2),.q_l1(addout_l1_2));
adder_l1 adder_l1_3(.clk(clk),.rst(rst),.address_z_d(address_z_d[4]),.d_l1(lut_out3),.q_l1(addout_l1_3));
adder_l1 adder_l1_4(.clk(clk),.rst(rst),.address_z_d(address_z_d[4]),.d_l1(lut_out4),.q_l1(addout_l1_4));



//ram_ai
ram_ai ram_ai1(.clk(clk),.address(svm_i_d2),.data_out(ai),.qin(qin_ai),.we(we_ai));


// Adding l1*4-->l2*2-->l3,ai-->Ai
always @(posedge clk, posedge rst)
begin
	if (rst) begin
	addout_l2_1<=	32'b10000000000000000000000000000000;
	addout_l2_2<=	32'b10000000000000000000000000000000;
	addout_l3_1<=	32'b10000000000000000000000000000000;
	ai_hold<=		32'b10000000000000000000000000000000;
	Ai<=				32'b10000000000000000000000000000000;
	end else begin
		if(address_z_d[0]) begin
		ai_hold<=ai;
		end
		
		if(address_z_d[4]) begin												//adding l1 -->l2
		addout_l2_1[29:0]<=addout_l1_1[29:0]+addout_l1_2[29:0];
		addout_l2_1[31:30]<=2'b00;
		addout_l2_2[29:0]<=addout_l1_3[29:0]+addout_l1_4[29:0];
		addout_l2_2[31:30]<=2'b00;
		end
		
		if(address_z_d[5]) begin												//adding l2 -->l3
		addout_l3_1[29:0]<=addout_l2_1[29:0]+addout_l2_2[29:0];
		addout_l3_1[31:30]<=2'b00;
		end
		
		if(address_z_d[6]) begin											//adding ai,l3 -->Ai
			case (ai_hold[31:30])
			2'b01:	begin													//ai,ai' neg pos
						Ai[29:0]<=ai_hold[29:0]+addout_l3_1[29:0];
						Ai[31:30]<=2'b01;
						end
			2'b00:	begin													//ai,ai' pos pos
						Ai[29:0]<=ai_hold[29:0]+addout_l3_1[29:0];
						Ai[31:30]<=2'b00;
						end
			2'b10:	Ai<=32'b10000000000000000000000000000000;	//ai zero
			default:	Ai<=32'b10000000000000000000000000000000;
			endcase	
			sop_Ai<=1'b1;
		end else begin
		sop_Ai<=1'b0;
		end
	
	end
end

endmodule
