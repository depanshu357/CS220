`include "DFF.v"

module TFF(q,clk,reset);
    input clk,reset;
    output q;
    wire d;
    DFF dff1(q,d,clk,reset);
    not n1(d,q);
endmodule