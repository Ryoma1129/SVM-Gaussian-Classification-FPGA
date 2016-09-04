module ram_ai(
address, // Address input
clk,
data_out ,		// Data output
qin,		// Data input
we			//write enable
);

input [9:0] address;
output[31:0] data_out; 
input [7:0] qin;
input we;
input clk;
           
reg [31:0] mem[0:628];
reg [31:0] data_out;


  
always @(posedge clk)
begin
  if (we==1) begin 
    mem[address] <= qin;
  end else begin
  data_out <= mem[address];
  end
end

initial
begin
  $readmemb("../Python_Code_Tester/init_a.dat",mem);
end
endmodule
