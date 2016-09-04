module adder_l1(
    input clk,
    input rst,
    input address_z_d,
    input [31:0] d_l1,
    output [31:0] q_l1
    );

wire		clk,rst;
wire	address_z_d;
wire		[31:0]d_l1;
reg		[31:0]q_l1;


always @(posedge clk, posedge rst)
begin
	if (rst) begin
	q_l1<=32'b10000000000000000000000000000000;
	end else begin
		case (address_z_d)
			1:				q_l1<=d_l1;
			default:		q_l1[29:0]<=q_l1[29:0]+d_l1[29:0];
		endcase
	end
end



endmodule
