`timescale 1ns / 10ps
module div2_tb;
reg clk,rst_n;
wire clkout;
always #10 clk = ~clk;

initial 
begin
clk = 1'b1;
rst_n = 1'b1;
#20;
rst_n = 1'b0;
#50;
rst_n = 1'b1;
end
		
div2 u_div2(.clkin(clk),.rst_n(rst_n),.clkout(clkout));
endmodule