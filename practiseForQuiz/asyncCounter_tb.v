`timescale 1ns/1ns
`include "asyncCounter.v"
module asyncCounter_tb;
    reg clk,rst;
    parameter SIZE = 4;
    wire [SIZE-1:0] cout;
    asyncCounter uut(clk,rst,cout);
    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("asyncCounter_tb.vcd");
        $dumpvars(0,asyncCounter_tb);
        $monitor(cout," ");
        rst = 1'b1;#10;
        rst = 1'b0;#400;

        $finish;
    end
    
endmodule