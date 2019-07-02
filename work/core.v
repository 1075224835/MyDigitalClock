module core(clk_1HZ,clk_2HZ,S1,S2,S3,S4,S5,S6,S7,S8,k1,hour_out,min_out,sec_out,led,led2,led3);
input clk_1HZ,clk_2HZ,S1,S2,S3,S4,S5,S6,S7,S8,k1;	
output reg led,led2,led3;
reg [6:0] hour=11,min=59,sec=40;
output reg[6:0] hour_out,min_out,sec_out;
reg[6:0]count=0;
reg flag=0;

always @(posedge clk_1HZ)

begin 
	 if(S1==0) 
	 begin 
	 sec<=0;
	 min<=0;
	 hour<=0;
	 end
	 else
	 begin
    if(S2==0) count<=count+1;
    if(count%2==0)
	 begin
	   flag<=!flag;
	   led2<=flag;
		led3<=flag;
		if(sec<59) sec<=sec+1;
		else 
			begin 
				sec<=0;
				if(min<59) min<=min+1;
				else
				begin
				    min<=0;
					if(hour<23) hour<=hour+1;
				 	else
				       hour<=0;
				end
			end
		 end
	else
		begin
		if(S3==0)
		begin
			if(hour<23) hour<=hour+1;
			else hour<=0;end
	
		if(S4==0)
		begin
			if(hour>0) hour<=hour-1;
			else hour<=23;end
	
		if(S5==0)
		begin
			if(min<59) min<=min+1;
			else min<=0;end
	
		if(S6==0)
		begin
			if(min>0) min<=min-1;
			else min<=59;end
	
		if(S7==0)
		begin
			if(sec<59) sec<=sec+1;
			else sec<=0;end
	
		if(S8==0)
		begin
			if(sec>0) sec<=sec-1;
		else sec<=59;end
		end
    end
	 if(k1==1)
	 begin
	 if(hour>11)hour_out<=hour-12;
	 else hour_out<=hour;
	 sec_out<=sec;
	 min_out<=min;
	 end
	 else
	 begin
    hour_out<=hour;
	 sec_out<=sec;
	 min_out<=min;
	 end
end
always @(1)
begin
if(min==0&&sec<5)
led<=clk_2HZ;
else
led<=0;
end
endmodule
