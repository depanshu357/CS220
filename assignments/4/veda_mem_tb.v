`timescale 1ns/1ns
`include "veda_mem.v"

module veda_mem_tb;

         reg clk,rst,we,Mode;
         reg [7:0] dataIn;
         reg [4:0] address;
         wire[7:0] q;

        veda_mem uut(clk,rst,we,address,dataIn,Mode,q);
        initial begin
            clk<=1;
            forever #5 clk <= ~clk;
        end
        initial begin
            $dumpfile("veda_mem_tb.vcd");
            $dumpvars(0,veda_mem_tb);
            $monitor(q," ");
            // dataIn  = 8'b01010101;
            // we = 1'b1;
            // address = 20;
            // rst = 1;
            // Mode = 1;#10;

            // dataIn  = 8'b01010101;
            // we = 1'b1;
            // address = 20;
            // rst = 0;
            // Mode = 1;#10;
            // dataIn  = 8'b01011101;
            // rst = 0;
            // we = 1'b1;
            // address = 17;
            // Mode = 1;#10;
            // rst = 0;
            // dataIn  = 8'b01010111;
            // we = 1'b0;
            // address = 17;
            // Mode = 1;#10;
            // rst = 0;
            // dataIn  = 8'b01110101;
            // we = 1'b0;
            // address = 20;
            // Mode = 1;#10;
            // rst = 0;
            // dataIn  = 8'b01110101;
            // we = 1'b0;
            // address = 20;
            // Mode = 0;#10;
            // rst = 0;
            // dataIn  = 8'b01110111;
            // we = 1'b1;
            // address = 25;
            // Mode = 1;#10;
            // rst = 0;
            // dataIn  = 8'b01110101;
            // we = 1'b0;
            // address = 20;
            // Mode = 0;#10;
            // rst = 0;
            // dataIn  = 8'b01110101;
            // we = 1'b0;
            // address = 25;
            // Mode = 0;#30;
            rst=1;we=0;address=0;dataIn=0;Mode=0;#20;
            rst=0;Mode=0;we=1;address=5;dataIn=27;#20;
            rst=0;Mode=0;we=1;address=8;dataIn=26;#20;
            rst=0;Mode=0;we=1;address=23;dataIn=25;#20;
            rst=0;Mode=1;we=1;address=8;dataIn=27;#20;
            rst=0;Mode=1;we=1;address=5;dataIn=27;#20;
            rst=0;Mode=1;we=1;address=23;dataIn=27;#20;
            $finish;
        end
endmodule