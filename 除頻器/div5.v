module div_5
(
input clk,
input rst_n,
output clk_div,
output [2:0] cnt1_r,
output [2:0] cnt2_r,
output clk_div1_r,
output clk_div2_r
);

parameter NUM_DIV = 5;
reg[2:0] cnt1; 
reg[2:0] cnt2;
reg clk_div1;
reg clk_div2;
    
always @(posedge clk or negedge rst_n) 
begin
    if(!rst_n)
    begin
    cnt1 <= 0;
    end
    else 
    begin
        if(cnt1 < NUM_DIV - 1)
        begin
        cnt1 <= cnt1 + 1'b1;
        end
        else
        begin
        cnt1 <= 0;
        end
     end   
end

always @(posedge clk or negedge rst_n) 
begin 
    if(!rst_n)
    begin
    clk_div1 <= 1'b1;
    end
    else
    begin 
        if(cnt1 < NUM_DIV / 2)
        begin
        clk_div1 <= 1'b1;
        end
        else
        begin
        clk_div1 <= 1'b0;
        end
    end   
end

always @(negedge clk or negedge rst_n) 
begin
    if(!rst_n)
    begin
    cnt2 <= 0;
    end
    else
    begin 
        if(cnt2 < NUM_DIV - 1)
        begin
        cnt2 <= cnt2 + 1'b1;
        end
        else
        begin
        cnt2 <= 0;
        end
    end   
end

always @(negedge clk or negedge rst_n) 
begin
    if(!rst_n)
    begin
    clk_div2 <= 1'b1;
    end
    else
    begin
        if(cnt2 < NUM_DIV / 2)
        begin
        clk_div2 <= 1'b1;
        end
        else
        begin
        clk_div2 <= 1'b0;
        end
    end 
end

assign clk_div = clk_div1 | clk_div2;
assign cnt1_r = cnt1;
assign cnt2_r = cnt2;
assign clk_div1_r = clk_div1; 
assign clk_div2_r = clk_div2; 

endmodule
