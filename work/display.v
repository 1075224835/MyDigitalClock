module display(clk,hour,min,sec,selct,a,b,c,d,e,f,g,Sel0,Sel1,Sel2,Sel3,Sel4,Sel5);
input[6:0] hour,min,sec;
input[3:0] selct;
input clk;
output reg a,b,c,d,e,f,g,Sel0,Sel1,Sel2,Sel3,Sel4,Sel5;
reg [5:0]num,hour_a,hour_b,min_a,min_b,sec_a,sec_b;

always @(posedge clk)
begin 
	begin
	hour_b<=hour%10;
	hour_a<=(hour-hour_b)/10;
	min_b<=min%10;
	min_a<=(min-min_b)/10;
	sec_b<=sec%10;
	sec_a<=(sec-sec_b)/10;
	end
    case(selct)
	0:begin num<=min_b;{Sel0,Sel1,Sel2,Sel3,Sel4,Sel5}=6'b101111;end
	1:begin num<=min_a;{Sel0,Sel1,Sel2,Sel3,Sel4,Sel5}=6'b110111;end
	2:begin num<=hour_b;{Sel0,Sel1,Sel2,Sel3,Sel4,Sel5}=6'b111011;end
	3:begin num<=hour_a;{Sel0,Sel1,Sel2,Sel3,Sel4,Sel5}=6'b111101;end
	4:begin num<=sec_b;{Sel0,Sel1,Sel2,Sel3,Sel4,Sel5}=6'b111110;end
	5:begin num<=sec_a;{Sel0,Sel1,Sel2,Sel3,Sel4,Sel5}=6'b011111;end
	endcase
    case(num)
	0:{a,b,c,d,e,f,g}=7'b0000001;
	1:{a,b,c,d,e,f,g}=7'b1001111;
	2:{a,b,c,d,e,f,g}=7'b0010010;
	3:{a,b,c,d,e,f,g}=7'b0000110;
	4:{a,b,c,d,e,f,g}=7'b1001100;
	5:{a,b,c,d,e,f,g}=7'b0100100;
	6:{a,b,c,d,e,f,g}=7'b0100000;
	7:{a,b,c,d,e,f,g}=7'b0001111;
	8:{a,b,c,d,e,f,g}=7'b0000000;
	9:{a,b,c,d,e,f,g}=7'b0000100;
	10:{a,b,c,d,e,f,g}=7'b1111110;
	endcase
end
endmodule
