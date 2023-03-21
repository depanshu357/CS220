module decideIns(op,funct,clk);
    input clk;
     input [5:0] op;
     input [5:0] funct;
     always @(posedge clk) begin
        case(op)
            6'b000000 : case(funct)
                            6'b100000 : $display("add");
                            6'b100001 : $display("addu");
                            6'b100010 : $display("sub");
                            6'b100011 : $display("subu");
                            6'b100100 : $display("and");
                            6'b100101 : $display("or");
                            6'b001000 : $display("jr");
                            6'b001000 : $display("jr");
                            6'b101010 : $display("sli");
                            6'b000000 : $display("sll");
                            6'b000010 : $display("srl");
                        endcase
            6'b001000 : $display("addi");
            6'b001001 : $display("addiu");
            6'b001100 : $display("andi");
            6'b001101 : $display("ori");
            6'b100011 : $display("lw");
            6'b101011 : $display("sw");
            6'b000100 : $display("beq");
            6'b000101 : $display("bne");
            6'b000111 : $display("bgt");
            6'b001111 : $display("bgte");
            6'b000110 : $display("ble");
            6'b011111 : $display("bleq");
            6'b000010 : $display("j");
            6'b000010 : $display("j");
            6'b000011 : $display("jal");
            6'b001010 : $display("slti");

        endcase
     end
endmodule