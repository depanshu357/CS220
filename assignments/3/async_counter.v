`timescale 1s/1s
`include "TFF.v"
// `include "DFF.v"

module async_counter(clk,q,reset);
    input reset;
    input clk;
    output reg [3:0] q;
    // reg q;
    wire [3:0] q_wire;
    // integer counter ;
    // integer i;
    // initial begin
        // counter = 0;
        // clk = 0;
        // forever #1 assign clk = ~clk;
    // end
    // always @(posedge clk) begin
        // count<= counter;
        // counter = counter + 1;
        // if(counter==7)counter=0;
        TFF uut(q_wire[0],clk,reset);
        TFF tff2(q_wire[1],q_wire[0],reset);
        TFF tff3(q_wire[2],q_wire[1],reset);
        TFF tff4(q_wire[3],q_wire[2],reset);
        always @(*)
        q <= q_wire;
        // $display(" %d ",q);

    // end

endmodule