`timescale 1ns / 10ps
module div2
(
input clkin,
input rst_n,
output  clkout
);	
reg clkout_r;
parameter Divider_Counter = 2;
reg [1:0] Counter = 0;
	
always@(posedge clkin or negedge rst_n)
begin
    if(!rst_n)
    begin
    Counter <= 1'b0;
    end
    else 
    begin
        if(Counter == (Divider_Counter-1))
        begin
        Counter <= 0;
        end
        else
        begin 
        Counter <= Counter + 1;
        end
     end		
 end
always@(posedge clkin or negedge rst_n)
begin
    if(!rst_n)
    begin
    clkout_r <= 1'b0;
    end
	else 
	begin
        if(Counter < Divider_Counter/2)
        begin
        clkout_r <= 1'b0;
        end
	    else
	    begin 
		clkout_r <= 1'b1;
		end
	end		
end
assign  clkout = clkout_r ;
endmodule