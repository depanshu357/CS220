`include "DFF.v"

module TFF(q,clk,rst);
input clk,rst;
output q;
wire d;
    DFF uut(q,d,clk,rst);
    not(d,q);    
endmodule