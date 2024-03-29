`timescale 1ps/1ps
`include "decideIns.v"
module testFetch;
    reg clk;
    initial begin
        clk = 1;
        forever #5 clk = ~clk;
    end
    decideIns uut(clk);
    initial begin
        $dumpfile("testFetch.vcd");
        $dumpvars(0,testFetch);
        clk = 1;#5;
        // $monitor()
        #260;
        $finish;
    end

endmodule