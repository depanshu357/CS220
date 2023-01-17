module block_non_block_tb;
    reg t_a,t_b,t_c,t_d,t_e,t_f;
    wire t_g;
    block_non_block mygate(.a(t_a),.b(t_b),.c(t_c),.d(t_d),.e(t_e),.f(t_f),.g(t_g));
    initial begin
        $dumpfile("block_non_block_tb.vcd");
        $dumpvars(0,block_non_block_tb);
        $monitor(t_a,t_b,t_c,t_d,t_e,t_f,t_g);
        t_a=1'b0;t_b=1'b0;t_c=1'b0;t_d=1'b0;t_e=1'b0;t_f=1'b0;
        #5;
        t_a=1'b0;t_b=1'b1;t_c=1'b0;t_d=1'b0;t_e=1'b0;t_f=1'b0;
        #5;
        t_a=1'b0;t_b=1'b0;t_c=1'b1;t_d=1'b0;t_e=1'b0;t_f=1'b0;
        #5;
        t_a=1'b0;t_b=1'b0;t_c=1'b0;t_d=1'b1;t_e=1'b0;t_f=1'b0;
        #5;
        t_a=1'b0;t_b=1'b0;t_c=1'b0;t_d=1'b0;t_e=1'b0;t_f=1'b1;
        #5;
        $display("Test Completed");
    end

endmodule