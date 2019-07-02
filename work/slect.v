module slect(clk_1KHZ,selct);

input clk_1KHZ;

output selct;

reg[3:0] selct=0;

always @(posedge clk_1KHZ)
begin 
      selct=selct+1;
        if (selct>5) selct<=0;
end
endmodule
