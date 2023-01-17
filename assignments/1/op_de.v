module op_de(cin,cout);
    input [2:0] cin;
    output [7:0] cout;
    generate
        and(cout[0],~cin[0],cin[1],cin[2]);
        and(cout[1],cin[0],~cin[1],cin[2]);
        and(cout[2],cin[0],cin[1],~cin[2]);
        and(cout[3],~cin[0],~cin[1],~cin[2]);
        and(cout[4],~cin[0],~cin[1],cin[2]);
        and(cout[5],~cin[0],cin[1],~cin[2]);
        and(cout[6],cin[0],~cin[1],~cin[2]);
        and(cout[7],cin[0],cin[1],cin[2]);
    endgenerate
endmodule
//////////////////////////////////////////////////////////////////////////////////
module op_de(cin1,cin2,cin3,cout1,cout2,cout3,cout4,cout5,cout6,cou7,cout8);
    input cin1,cin2,cin3;
    output cout1,cout2,cout3,cout4,cout5,cout6,cou7,cout8;
    generate
        and(cout8,~cin3,cin1,cin2);
        and(cout1,cin3,~cin1,cin2);
        and(cout2,cin3,cin1,~cin2);
        and(cout3,~cin3,~cin1,~cin2);
        and(cout4,~cin3,~cin1,cin2);
        and(cout5,~cin3,cin1,~cin2);
        and(cout6,cin3,~cin1,~cin2);
        and(cout7,cin3,cin1,cin2);
    endgenerate
endmodule