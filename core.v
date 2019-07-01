module core(
		input clk_1HZ,clk_2HZ,S1,S2,S3,S4,S5,S6,S7,S8,
		output reg [5:0] hour_a,hour_b,min_a,min_b,sec_a,sec_b,
		output reg led
		);
		
reg[6:0] hour=11,min=59,sec=40;

always @(posedge clk_1HZ)

begin 
	if(sec<60) sec<=sec+1;
	else 
		begin 
			sec<=0;
			if(min<60) min<=min+1;
			else
			min<=0;
			begin
				min<=0;
				if(hour<12) hour<=hour+1;
				else
				hour<=0;
			end
	    end
	 begin
	 hour_b<=hour%10;
	 hour_a<=hour-hour_b;
	 min_b<=min%10;
	 min_a<=(min-min_b)/10;
	 sec_b<=sec%10;
	 sec_a<=(sec-sec_b)/10;
	 end
end
always @(*)
begin
if(min==59&&sec>54)
led<=clk_2HZ;
else
led<=0;
end
endmodule
