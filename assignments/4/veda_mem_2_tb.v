`timescale 1ps/1ps
`include "veda_mem_2.v"
module veda_mem_2_tb;
    reg clk,rst,we,Mode;
    reg [5:0] address_a;
    reg [5:0] address_b;
    reg [7:0] dataIn;
    wire [7:0] dataOut;
    veda_mem_2 uut(clk,rst,we,address_a,address_b,dataIn,Mode,dataOut);
    initial begin
        clk<= 1;
        forever #5 clk <= ~clk;
    end
    initial begin
        $dumpfile("veda_mem_2_tb.vcd");
        $dumpvars(0,veda_mem_2_tb);
        $monitor(dataOut);
        // dataIn  = 8'b01010101;
        //     we = 1'b1;
        //     address_a = 20;
        //     address_b = 20;
        //     rst = 1;
        //     Mode = 1;#10;

        // dataIn  = 8'b01010101;
        //     we = 1'b1;
        //     address_a = 20;
        //     address_b = 20;
        //     rst = 0;
        //     Mode = 1;#10;
            
        // dataIn  = 8'b01011101;
        //     we = 1'b1;
        //     address_a = 23;
        //     address_b = 20;
        //     rst = 0;
        //     Mode = 1;#10;

        // dataIn  = 8'b01010111;
        //     we = 1'b1;
        //     address_a = 20;
        //     address_b = 20;
        //     rst = 0;
        //     Mode = 0;#10;

        // dataIn  = 8'b01110101;
        //     we = 1'b1;
        //     address_a = 26;
        //     address_b = 23;
        //     rst = 0;
        //     Mode = 1;#10;

        // dataIn  = 8'b01010111;
        //     we = 1'b0;
        //     address_a = 20;
        //     address_b = 20;
        //     rst = 0;
        //     Mode = 0;#10;

        // dataIn  = 8'b01110101;
        //     we = 1'b0;
        //     address_a = 26;
        //     address_b = 23;
        //     rst = 0;
        //     Mode = 1;#10;
        rst=1;we=0;address_a=0;address_b=0;dataIn=0;Mode=0;#10;

    rst=0;Mode=0;we=1;address_a=5; address_b=0;dataIn=27;#10;
    rst=0;Mode=0;we=1;address_a=8; address_b=5;dataIn=26;#10;
    rst=0;Mode=0;we=1;address_a=23; address_b=8;dataIn=25;#10;
    rst=0;Mode=1;we=1;address_a=8; address_b=23;dataIn=27;#10;
    rst=0;Mode=1;we=1;address_a=5; address_b=8;dataIn=27;#10;
    rst=0;Mode=1;we=1;address_a=20; address_b=23;dataIn=27;#10;#10;
        $finish;
    end
endmodule