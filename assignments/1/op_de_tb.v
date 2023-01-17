`timescale 1ns/1ns
`include "op_de.v"

module op_de_tb;
    reg [2:0] cin;
    wire [7:0] cout;
    op_de uut(cin,cout);
    initial begin
        $dumpfile("op_de_tb.vcd");
        $dumpvars(0,op_de_tb);
      $monitor(cin," ",cout);
      cin = 3'b101;#5;
      cin = 3'b111;#5;
      cin = 3'b110;#5;
      $display("Test completed");
    end
endmodule