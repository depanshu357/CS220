`include "decideIns.v"
module fetch(clk);
    input address,clk,rst;
    input [4:0] r1;
    input [4:0] r2;
    reg [31:0] insMem [24:0];
    reg [5:0] rs;reg [5:0]rt;reg [5:0]rd;
    reg [5:0] PC =0;
    initial begin
    //Arithmetic
    insMem[0][31:26]=6'b000000;insMem[0][5:0]=6'b100000;insMem[0][24:20]=r1;insMem[0][19:15]=r2;    //add
    insMem[1][31:26]=6'b000000;insMem[1][5:0]=6'b100010;//sub
    insMem[2][31:26]=6'b000000;insMem[2][5:0]=6'b100001;//addu
    insMem[3][31:26]=6'b000000;insMem[3][5:0]=6'b100011;//subu
    insMem[4][31:26]=6'b001000;insMem[4][5:0]=6'b000000;//addi
    insMem[5][31:26]=6'b001001;insMem[5][5:0]=6'b000000;//addiu
    //Logical
    insMem[6][31:26]=6'b000000;insMem[6][5:0]=6'b100100;//and
    insMem[7][31:26]=6'b000000;insMem[7][5:0]=6'b100101;//or
    insMem[8][31:26]=6'b001100;insMem[8][5:0]=6'b000000;//andi
    insMem[9][31:26]=6'b001101;insMem[9][5:0]=6'b000000;//ori
    insMem[10][31:26]=6'b000000;insMem[10][5:0]=6'b000000;//sll
    insMem[11][31:26]=6'b000000;insMem[11][5:0]=6'b000010;//srl
    //Data Transfer
    insMem[12][31:26]=6'b100011;insMem[12][5:0]=6'b000000;//lw
    insMem[13][31:26]=6'b101011;insMem[13][5:0]=6'b000000;//sw
    //Conditional Branch
    insMem[14][31:26]=6'b000100;insMem[14][5:0]=6'b000000;//beq
    insMem[15][31:26]=6'b000101;insMem[15][5:0]=6'b000000;//bne
    insMem[16][31:26]=6'b000111;insMem[16][5:0]=6'b000000;//bgt
    insMem[17][31:26]=6'b001111;insMem[17][5:0]=6'b000000;//bgte
    insMem[18][31:26]=6'b000110;insMem[18][5:0]=6'b000000;//ble
    insMem[19][31:26]=6'b011111;insMem[19][5:0]=6'b000000;//bleq
    //Unconditional branch
    insMem[20][31:26]=6'b000010;insMem[20][5:0]=6'b000000;//j
    insMem[21][31:26]=6'b000000;insMem[21][5:0]=6'b001000;//jr
    insMem[22][31:26]=6'b000011;insMem[22][5:0]=6'b000000;//jal
    //Comparision
    insMem[23][31:26]=6'b000000;insMem[23][5:0]=6'b101010;//sli
    insMem[24][31:26]=6'b001010;insMem[24][5:0]=6'b000000;//slti
    PC =0;
    end
        decideIns uut(insMem[PC][31:26],insMem[PC][5:0],clk);
    always @(posedge clk) begin
        PC <= PC + 1;
    end
endmodule