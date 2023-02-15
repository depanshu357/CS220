module veda_mem(clk,rst,we,address,dataIn,Mode,q);
parameter SIZE = 32;
input [7:0] dataIn;
input [4:0] address;
input clk,rst,we,Mode;
output reg [7:0] q;

reg [7:0] ram[SIZE-1:0];
reg [4:0]adderss_reg ;
integer i;

always @(posedge clk)begin : memory
    if(rst) begin
        for(i=0;i<32;i++) begin: kuchTohHai
        ram[i] <=0;
        end
        q<= 0;
        adderss_reg <=0;
    end
    else begin
    if(Mode == 0) begin
        if(we) begin
            adderss_reg <= address;
            ram[address] <= dataIn;
        end
        else begin
            adderss_reg <= address;
        end
        q <= ram[adderss_reg];
        end
        else begin
        adderss_reg <= address;
        q<= ram[adderss_reg];
    end
    end
   
end
endmodule