module fenpin (clk,clk_1HZ,clk_2HZ);
input clk;
output clk_1HZ,clk_2HZ;
reg clk_1HZ,clk_2HZ;
reg[10:0] count=0;

always @(posedge clk)
begin 
      count<=count+1;
	begin
        if(count<250)	begin clk_2HZ<=1;clk_1HZ<=1;end
        else if(count<500) clk_2HZ<=0;  
        else if(count<750)begin clk_2HZ<=1;clk_1HZ<=0;end
        else if(count<1000) clk_2HZ<=0;
        if (count==1000) count<=0;
	end
end
endmodule
