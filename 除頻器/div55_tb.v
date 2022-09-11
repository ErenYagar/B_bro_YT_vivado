`timescale 1ns/1ps
module tb_div55;
reg clk,rst_n;
wire clk_div;
wire [5:0] cnt1_r;
wire [5:0] cnt2_r;
wire clk_div1_r;
wire clk_div2_r;
always #5 clk = !clk;

initial 
begin
clk = 1'b0;
rst_n = 1'b1;
#50;
rst_n = 1'b0; //reset
#80;
rst_n = 1'b1; 
end

div_55 dut
(
.clk(clk),
.rst_n(rst_n),
.clk_div(clk_div),
.cnt1_r(cnt1_r),
.cnt2_r(cnt2_r),
.clk_div1_r(clk_div1_r),
.clk_div2_r(clk_div2_r)
);
endmodule