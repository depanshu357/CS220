`include "block_and_non_block.v"

module block_and_non_block_tb;
    reg c;
    wire b,a;
    block_and_non_block uut(a,b,c);
    initial begin
        $dumpfile("block_and_non_block_tb.vcd");
        $dumpvars(0,block_and_non_block_tb);
        $monitor(a," ",b," ",c);
        c = 0;#5;
        $display("test completed");
        $finish;
    end
endmodule