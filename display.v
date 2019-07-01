module display(clk,hour_a,hour_b,min_a,min_b,sec_a,sec_b,selct,a,b,c,d,e,f,g,Sel0,Sel1,Sel2);
input[4:0] hour_a,hour_b,min_a,min_b,sec_a,sec_b;
input[3:0] selct;
input clk;
output reg a,b,c,d,e,f,g,Sel0,Sel1,Sel2;
reg [3:0]num;

always @(posedge clk)
begin 
    {Sel0,Sel1,Sel2}= selct;
    case(selct)
	0:num<=hour_a;
	1:num<=hour_b;
	2:num<=10;
	3:num<=min_a;
	4:num<=min_b;
	5:num<=10;
	6:num<=sec_a;
	7:num<=sec_b;
	endcase
    case(num)
	0:{a,b,c,d,e,f,g}=7'b1111110;
	1:{a,b,c,d,e,f,g}=7'b0110000;
	2:{a,b,c,d,e,f,g}=7'b1101101;
	3:{a,b,c,d,e,f,g}=7'b1111001;
	4:{a,b,c,d,e,f,g}=7'b0110011;
	5:{a,b,c,d,e,f,g}=7'b1011011;
	6:{a,b,c,d,e,f,g}=7'b1011111;
	7:{a,b,c,d,e,f,g}=7'b1110000;
	8:{a,b,c,d,e,f,g}=7'b1111111;
	9:{a,b,c,d,e,f,g}=7'b1111011;
	10:{a,b,c,d,e,f,g}=7'b0000001;
	endcase
end
endmodule
