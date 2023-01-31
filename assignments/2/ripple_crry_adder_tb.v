`timescale 1ns/1ns
`include "ripple_crry_adder.v"

module ripple_crry_adder_tb;
    parameter MaxSize = 128;
    reg [MaxSize-1:0] a,b;
    reg cin;
    wire cout;
    wire[MaxSize-1:0] sum;
    ripple_crry_adder uut(a,b,cin,cout,sum);
    initial begin
        $dumpfile("ripple_crry_adder.vcd");
        $dumpvars(0,ripple_crry_adder_tb);
        $monitor(a," ",b," ",cin," ",cout," ",sum);
        a = {64{2'b01}};b={64{2'b10}};cin = 0;#5;
        a = {64{2'b11}};b={64{2'b10}};cin = 0;#5;
        a = {64{2'b01}};b={64{2'b11}};cin = 0;#5;
        a = 2134;b=2345;cin = 0;#5;
        a = 2134;b=4349;cin = 0;#5;
        a = 2138;b=2346;cin = 0;#5;
        $finish;
    end
endmodule