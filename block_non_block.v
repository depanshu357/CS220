module block_non_block(a,b,c,d,e,f,g);
    input a,b,c,d,e,f;
    output g;
    assign g = a|b|c|d|e|f;
endmodule