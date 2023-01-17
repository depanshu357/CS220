module first(A,B);
    input A;
    output B;
    initial begin
    if(B==0)
    assign B= A;
    else
    assign B= B+A;
    end
endmodule