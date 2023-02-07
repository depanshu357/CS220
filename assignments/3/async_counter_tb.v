`timescale 1s/1s
`include "async_counter.v"
module async_counter_tb;
    reg reset;
    wire [3:0] q;
    reg clk;
    // clk = 0;
    async_counter uut(clk,q,reset);
    initial begin 
        clk  = 0;
         forever #1  clk=~clk;
    end
    initial begin
        $dumpfile("async_counter_tb.vcd");
        $dumpvars(0,async_counter_tb);
        reset  =0;#10;
        clk = 0;#10;
        reset  =1;#10;
        clk = 1;#10;
        reset  =1;#10;
        clk = 0;#10;
        reset  =0;#10;
        clk = 1;#10;
        $finish;
        $monitor(q);
    end

endmodule