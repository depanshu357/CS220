// `include "decideIns.v"
module fetch(clk,PC,instruction);
    input clk;
    reg [4:0] r1;
    reg [4:0] r2;
    reg [4:0] r3;
    reg [4:0] r4;
    reg [31:0] insMem [24:0];
    reg [5:0] rs;reg [5:0]rt;reg [5:0]rd;
    input wire [31:0] PC ;
    wire [31:0] PCnew =0 ;
    output reg [31:0] instruction ;
    initial begin
        r1 = 17;//101010
        r2 =16;//001011
        r3 =18;//001011
        r4 =17;//0010011
    //Arithmetic
    insMem[0][31:26]=6'b000000;insMem[0][5:0]=6'b100000;insMem[0][25:21]=r3;insMem[0][20:16]=r2;insMem[0][15:11]=r1;insMem[0][10:6]=0 ;//add
    insMem[1][31:26]=6'b000000;insMem[1][5:0]=6'b100010;insMem[1][25:21]=r3;insMem[1][20:16]=r2;insMem[1][15:11]=r1;insMem[1][10:6]=0;//sub
    insMem[2][31:26]=6'b000000;insMem[2][5:0]=6'b100001;insMem[2][25:21]=r3;insMem[2][20:16]=r2;insMem[2][15:11]=r1;insMem[2][10:6]=0;//addu
    insMem[3][31:26]=6'b000000;insMem[3][5:0]=6'b100011;insMem[3][25:21]=r3;insMem[3][20:16]=r2;insMem[3][15:11]=r1;insMem[3][10:6]=0;//subu
    insMem[4][31:26]=6'b001000;insMem[4][25:21]=r2;insMem[4][20:16]=r1;insMem[4][15:0]=19;//addi
    insMem[5][31:26]=6'b001001;insMem[5][25:21]=r2;insMem[5][20:16]=r1;insMem[5][15:0]=19;//addiu
    //Logical
    insMem[6][31:26]=6'b000000;insMem[6][5:0]=6'b100100;insMem[6][25:21]=r1;insMem[6][20:16]=r2;insMem[6][15:11]=r3;insMem[6][10:6]=0;//and
    insMem[7][31:26]=6'b000000;insMem[7][5:0]=6'b100101;insMem[7][25:21]=r1;insMem[7][20:16]=r2;insMem[7][15:11]=r3;insMem[7][10:6]=0;//or
    insMem[8][31:26]=6'b001100;insMem[8][25:21]=r1;insMem[8][20:16]=r2;insMem[8][15:0]=19;//andi
    insMem[9][31:26]=6'b001101;insMem[9][25:21]=r1;insMem[9][20:16]=r2;insMem[9][15:0]=19;//ori
    insMem[10][31:26]=6'b000000;insMem[10][5:0]=6'b000000;insMem[10][15:6]=3;insMem[10][25:21]=r1;insMem[10][20:16]=r2;//sll
    insMem[11][31:26]=6'b000000;insMem[11][5:0]=6'b000010;insMem[11][15:6]=2;insMem[11][25:21]=r1;insMem[11][20:16]=r2;//srl
    //Data Transfer
    insMem[12][31:26]=6'b100011;insMem[12][25:21]=r1;insMem[12][20:0]=r2;//lw
    insMem[13][31:26]=6'b101011;insMem[13][25:21]=r1;insMem[13][20:0]=r2;//sw
    //Conditional Branch
    insMem[14][31:26]=6'b000100;insMem[14][25:21]=r1;insMem[14][20:16]=r4;insMem[14][15:0]=6'b000000;//beq
    insMem[15][31:26]=6'b000101;insMem[15][25:21]=r1;insMem[15][20:16]=r4;insMem[15][15:0]=6'b000000;//bne
    insMem[16][31:26]=6'b000111;insMem[15][25:21]=r1;insMem[16][20:16]=r4;insMem[16][15:0]=6'b000000;//bgt
    insMem[17][31:26]=6'b001111;insMem[15][25:21]=r1;insMem[17][20:16]=r4;insMem[17][15:0]=6'b000000;//bgte
    insMem[18][31:26]=6'b000110;insMem[15][25:21]=r1;insMem[18][20:16]=r4;insMem[18][15:0]=6'b000000;//ble
    insMem[19][31:26]=6'b011111;insMem[15][25:21]=r1;insMem[19][20:16]=r4;insMem[19][15:0]=6'b000000;//bleq
    //Unconditional branch
    insMem[20][31:26]=6'b000010;insMem[20][25:0]=25'b001101;//j
    insMem[21][31:26]=6'b000000;insMem[21][5:0]=6'b001000;insMem[21][25:21]=16;insMem[21][20:16]=r2;insMem[21][15:11]=31;insMem[21][10:6]=r4 ;//jr
    insMem[22][31:26]=6'b000011;insMem[22][25:0]=25'b000110;//jal
    //Comparision
    insMem[23][31:26]=6'b000000;insMem[23][25:21]=r1;insMem[23][20:16]=r2;insMem[23][15:11]=r3;insMem[23][10:6]=5'b00000;insMem[23][5:0]=6'b101010;//slt
    insMem[24][31:26]=6'b001010;insMem[24][25:21]=r3;insMem[24][20:16]=r2;insMem[24][15:0]=6'b000000;//slti
    end
    // decideIns uut(instruction,clk,PC,PCnew);
    always @(posedge clk) begin
        // if(PCnew==32'b000000) begin
        // PC <= PC + 1;
        // end else begin
        //     PC = PCnew ;
        // end
        instruction = insMem[PC];
    end
endmodule