module mux_tb;
    reg [2:0]t_X,t_Y;
    reg t_S;
    wire [2:0] t_M;
    mux my_mux(t_X,t_Y,t_S,t_M);

    initial begin
        $monitor(t_X,t_Y,t_S,t_M);
        t_X=3'b011;t_Y=3'b000;t_S=1'b0;
        #5;
        t_X=3'b011;t_Y=3'b100;t_S=1'b1;
        #5;
        t_X=3'b011;t_Y=3'b110;t_S=1'b1;
        #5;
        t_X=3'b111;t_Y=3'b000;t_S=1'b0;
        #5;
    end
endmodule