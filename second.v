module second(A,B);
    input reg A,C;
    output reg B;
    assign A=0;
    assign B=0;
    assign C=0;
    always @(A,B,C) begin
       assign C=1;
        // A <= C;
        assign B=C;
    end
    $display("%0d %0d %0d",A,B,C);
endmodule