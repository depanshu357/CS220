`timescale 1ns/1ns
`include "storm_breaker.v"

module storm_breaker_tb;
    parameter MaxSize = 128;
    reg [MaxSize-1:0] a,b;
    reg c0;
    wire p0;
    wire [MaxSize-1:0] sum;
    wire cout;
    storm_breaker uut(a,b,c0,sum,cout,p0);
    initial begin
        $dumpfile("storm_breaker_tb.vcd");
        $dumpvars(0,storm_breaker_tb);
        $monitor("inputs ",a," ",b," ",c0," outputs ",sum," ",cout," ",p0);
        a = {64{2'b01}};b = {64{2'b10}};c0 = 0;#5;
        a = 1234;b = 1345;c0 = 1;#5;
        a = 1234;b = 1325;c0 = 0;#5;
        a = 1234;b = 2345;c0 = 1;#5;
        $finish;
    end

    
endmodule