module ram_x(
address, // Address input
clk,
data_out,		// Data output
qin,		// Data input
we			//write enable
);

input  [7:0] address;
output [31:0] data_out;
input  [31:0] qin;
input  we;
input  clk;
           
reg [31:0] mem[0:224];  
reg [31:0] data_out;

  
always @ (posedge clk)
begin
  if (we) begin 
  mem[address] = qin;
  end else begin
  data_out = mem[address];
  end
end

integer i;
initial
begin
  for(i=0;i<225;i=i+1) begin
  mem[i]=0;
  end
end


endmodule
