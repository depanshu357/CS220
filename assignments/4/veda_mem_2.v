module veda_mem_2(clk,rst,we,address_a,address_b,dataIn,Mode,dataOut);
    input clk,rst,we,Mode;
    input  [5:0] address_a;
    input  [5:0] address_b;
    input [7:0] dataIn;
    output reg [7:0] dataOut;
    
    reg [7:0] ram [31:0];
    reg [4:0] address_reg ;
    integer i;
    always @(posedge clk) begin: veda_mem_2
    if(rst) begin
        for( i=0;i<32;i++) begin: kuchTohHai
            ram[i] <=0;
        end
        dataOut <= 0;
        address_reg <= 0;
    end
    else begin
        if(Mode==0) begin
            if(we) begin
                ram[address_a] <= dataIn;
                address_reg <= address_a;
            end 
            else begin
                address_reg <=address_a;
            end
            dataOut <= ram[address_b];
        end
        else begin
            address_reg <= address_b;
            dataOut <= ram[address_reg];
        end
    end
    end
endmodule