`timescale 1ns/1ns
`include "seq_det.v"
module seq_det_tb;
    reg clk,rst,req;
    wire gnt;
    seq_det uut(clk,rst,req,gnt);
    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk; 
    end
    initial begin
        $dumpfile("seq_det_tb.vcd");
        $dumpvars(0,seq_det_tb);
        $monitor(clk," ",gnt);
        rst = 1'b1;#10;
        rst = 1'b0;req = 1'b1;#10;
        rst = 1'b0;req = 1'b1;#10;
        rst = 1'b0;req = 1'b1;#10;
        rst = 1'b0;req = 1'b0;#10;
        rst = 1'b0;req = 1'b1;#10;
        rst = 1'b0;req = 1'b1;#10;
        rst = 1'b0;req = 1'b1;#10;
        #30;
        $finish;
    rst = 1'b1;
    end
endmodule