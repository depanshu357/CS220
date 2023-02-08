`timescale 1ns/1ns
`include "op_de.v"
module op_de_tb;
reg A,B,C;
wire [7:0]Out;

op_de uut(A,B,C,Out);

initial begin
    $dumpfile("op_de_tb.vcd");
    $dumpvars(0,op_de_tb);

    $monitor(A,B,C,Out);
    A = 0; B = 0; C = 0; #20;
    A = 0; B = 0; C = 1; #20;
    A = 0; B = 1; C = 0; #20;
    A = 0; B = 1; C = 1; #20;
    A = 1; B = 0; C = 0; #20;
    A = 1; B = 0; C = 1; #20;
    A = 1; B = 1; C = 0; #20;
    A = 1; B = 1; C = 1; #20;
$display("Test Complete");
end
endmodule
// module op_de_tb;
//     reg [2:0] cin;
//     wire [7:0] cout;
//     op_de uut(cin,cout);
//     initial begin
//         $dumpfile("op_de_tb.vcd");
//         $dumpvars(0,op_de_tb);
//       $monitor(cin," ",cout);
//       cin = 3'b101;#5;
//       cin = 3'b111;#5;
//       cin = 3'b110;#5;
//       $display("Test completed");
//     end
// endmodule