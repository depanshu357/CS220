`timescale 1ns/1ns
`include "float_addercopy.v"

module float_adder_tb;
    reg clk;
    wire match;
    wire [31:0]given_ans;
    wire [31:0]dataOut;
    wire [31:0] temp;

    float_addercopy uut(clk,match,given_ans,dataOut,temp);
    initial begin
        clk = 1;
        forever #10 clk = ~clk;
    end
    initial begin
        $dumpfile("float_adder_tb.vcd");
        $dumpvars(0,float_adder_tb);
        $monitor("%b %b %b %b %b",clk,match,given_ans,dataOut,temp);
        // $monitor(clk," ",match," ",given_ans[22:0]," ",dataOut[22:0]);

        #20;
        $display(clk," ",match," ",given_ans," ",dataOut);
        #20;
        $finish;
    end

endmodule