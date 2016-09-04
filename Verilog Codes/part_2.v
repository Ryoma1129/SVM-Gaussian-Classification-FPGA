module part_2(
	input		clk,rst,
	input		[31:0]output_Ai,
	input		sop_Ai,
	output	[31:0]output_c,
	output	sop_c
    );
//input output declaration
wire		clk,rst;
wire		[31:0]output_Ai;
reg		[31:0]Ai;
wire		sop_Ai;
reg		[31:0]output_c;
reg		sop_c;

reg		[31:0]Bi;
reg		[9:0]sop_count;
reg		done_Bi;
reg		[3:0]sop_Ai_d;


//sop_c,sop_count,sop_Ai_delay
always @(posedge clk,posedge rst) begin
	if (rst) begin
	sop_c<=0;
	sop_count<=0;
	sop_Ai_d<=4'b0000;
	Ai<=0;
	end else begin
	//increasing count
		if(sop_Ai) begin
		sop_count<=sop_count+1;
		Ai<=output_Ai;
		end else begin
		
		end
		
		//sop_Ai_d
		if(sop_Ai && sop_count!=0) begin
		sop_Ai_d<=4'b0001;
		end else begin
		
		end
		
		
		if(sop_Ai_d>0) begin
		sop_Ai_d<=sop_Ai_d+1;
		end else begin
		
		end
		
		//reset count and sop_c
		if (sop_count==629 && done_Bi) begin
			sop_count<=0;
			sop_c<=1;
		end else begin 
			sop_c<=0;
		end
	
	end

end


reg		[31:0]gt,slr,Bi_p;
reg		[29:0]Ai_comp,Bi_mag,slr_comp;
reg		[30:0]x0,comp_sign;
reg		sub_to_zero;
wire		[29:0]add_x0,sub_x0;
		
//instantiating add_x0 and sub_x0
add_table	add_table1(.x(x0),.add_x(add_x0));
sub_table	sub_table1(.x(x0),.sub_x(sub_x0));


//actual logic block of the circuit
always @(posedge clk,posedge rst) begin
	if (rst) begin
	output_c<=0;done_Bi<=0;
	Bi<=0;
	gt<=0;slr<=0;Bi_p<=0;
	sub_to_zero<=0;
	Ai_comp<=0;Bi_mag<=0;slr_comp<=0;
	x0<=0;comp_sign<=0;
	end else begin
		if (sop_count==0 && sop_Ai) begin
		Bi<=output_Ai;
		end
		
		//evaluate -Ai
		if(sop_Ai_d==1) begin
		Ai_comp<=(~Ai[29:0])+1;
		Bi_mag<=Bi[29:0];
		end
		
		//evaluate Bi - Ai magnitudes
		if(sop_Ai_d==2) begin
			case ({Bi_mag[29],Ai_comp[29]})
			2'b00:	comp_sign	<=	{1'b0,Bi_mag[29:0]}+{1'b0,Ai_comp[29:0]};
			2'b01:	comp_sign	<=	{1'b0,Bi_mag[29:0]}+{1'b1,Ai_comp[29:0]};
			2'b10:	comp_sign	<=	{1'b1,Bi_mag[29:0]}+{1'b0,Ai_comp[29:0]};
			2'b11:	comp_sign	<=	{1'b1,Bi_mag[29:0]}+{1'b1,Ai_comp[29:0]};
			endcase
		end
		
		//evaluate gt and slr
		if(sop_Ai_d==3) begin
			if(~comp_sign[30]) begin
			gt<=Bi;slr<=Ai;
			end else begin
			gt<=Ai;slr<=Bi;
			end
		end
		
		//evaluate x0 = gt-slr
		if(sop_Ai_d==5) begin
			case (comp_sign[30])
			1'b0:		x0<= comp_sign;
			1'b1:		x0<= ~comp_sign+1;
			endcase
			
			if(comp_sign[30:0]==0 && ^{gt[30],slr[30]}) begin
				sub_to_zero<=1;
			end else
				sub_to_zero<=0;
		end
		
		//evaluate log(x0)+/-
		if(sop_Ai_d==6) begin
			case ({gt[30],slr[30]})
				2'b00: begin						//pos,pos
						 Bi_p[29:0]<=gt[29:0]+add_x0;
						 Bi_p[31:30]<=2'b00;
						 end
				2'b11: begin						//neg,neg
						 Bi_p[29:0]<=gt[29:0]+add_x0;
						 Bi_p[31:30]<=2'b01;
						 end
				2'b01: begin						//pos,neg
						 Bi_p[29:0]<=gt[29:0]+sub_x0;
						 Bi_p[31:30]<=2'b00;
						 end
				2'b10: begin						//neg,pos
						 Bi_p[29:0]<=gt[29:0]+sub_x0;
						 Bi_p[31:30]<=2'b01;
						 end
			endcase
		end
		
			
		//finally zero logic
		if(sop_Ai_d==7) begin
			case ({Bi[31],Ai[31],sub_to_zero})
				3'b100: Bi<=Ai;
				3'b101: Bi<=Ai;
				3'b010: Bi<=Bi;
				3'b011: Bi<=Bi;
				3'b110: Bi<=32'b10000000000000000000000000000000;
				3'b111: Bi<=32'b10000000000000000000000000000000;
				3'b001: Bi<=32'b10000000000000000000000000000000;
				3'b000: Bi<=Bi_p;
			endcase
			done_Bi<=1'b1;
			output_c<=Bi;
		end
		
		if(sop_Ai_d==8) begin
			done_Bi<=1'b0;
		end
		
	end




end



endmodule
