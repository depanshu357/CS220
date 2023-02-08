`timescale 1ns / 1ps
`include "T_FF.v"



module ripple_counter(q, clk,reset_outer);

output reg[3:0] q;
input clk,reset_outer;
wire reset;
wire [3:0] q_wire;
// assign q = 0;
assign reset = reset_outer & q[3];

T_FF tff0(q_wire[0],clk,reset);
T_FF tff1(q_wire[1],q_wire[0],reset);
T_FF  tff2(q_wire[2],q_wire[1], reset);
T_FF tff3(q_wire[3], q_wire[2], reset);
// assign reset = q[3];

endmodule
