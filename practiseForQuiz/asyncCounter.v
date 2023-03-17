`include "TFF.v"
module asyncCounter(clk,rst,cout);
    parameter SIZE = 4;
    input clk,rst;
    output [SIZE-1:0]cout ;
    wire cin = 1'b0;
    TFF uut1(cout[0],clk,rst);
    TFF uut2(cout[1],cout[0],rst);
    TFF uut3(cout[2],cout[1],rst);
    TFF uut4(cout[3],cout[2],rst);
    // generate
    //     genvar i;
    //     for(i=0;i<SIZE;i= i+1) begin
    //         if(i==0) begin
    //         TFF uut(cout[i],clk,rst);
    //         end else begin
    //             TFF uut2(cout[i],cout[i-1],rst);
    //         end
    //     end
    // endgenerate
endmodule