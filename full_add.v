module full_add(a1,a2,a3,a4,b1,b2,b3,b4,out1,out2,out3,out4,crr1,crr2,crr3,crr4);
 input a1,b1,a2,a3,a4,b2,b3,b4;
 output out1,out2,out3,out4,crr1,crr2,crr3,crr4;
 wire ex21,ex22,ex23,ex31,ex32,ex33,ex41,ex42,ex43;
 xor xor1(out1,a1,b1);
 and and1(crr1,a1,b1);

 xor xor21(out2,b2,a2,crr1);
 and and21(ex21,b2,a2);
 and and22(ex22,b2,crr1);
 and and2(ex23,a2,crr1);
 or or2(crr2,ex21,ex23,ex22);

 xor xor31(out3,b3,a3,crr2);
 and and31(ex31,b3,a3);
 and and32(ex32,crr2,a3);
 and and33(ex33,b3,crr2);
 or or3(crr3,ex31,ex32,ex33);

 xor xor41(out4,b4,a4,crr3);
 and and41(ex41,b4,a4);
 and and42(ex42,crr3,a4);
 and and43(ex43,b4,crr3);
 or or4(crr4,ex41,ex42,ex43);
endmodule