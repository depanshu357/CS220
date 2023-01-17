module full_subtr(a,b,cin,cout,brr);
    input a,b,cin;
    output cout,brr;
    wire temp1,temp2,temp3;
    xor(cout,a,b,cin);
    //cout (cin.a.b)|(a.~b)
    and(temp1,cin,b);
    and(temp2,~a,b);
    and(temp3,~a,cin);
    or(brr,temp1,temp2,temp3);

endmodule