`include "fetch.v"
module decideIns(clk);
    parameter SIZE = 32;
    input clk;
    output reg [31:0] PC;
    wire [31:0] ins;
    output [31:0] PCnew;
    reg [31:0] PCnew;
    reg signed [31:0] ram[SIZE-1:0];
    reg signed [31:0] mem[SIZE-1:0];
    reg [5:0] temp;
    fetch uut(clk,PC,ins);
    initial begin
    ram[0] = 0;
    PCnew  =0;
    temp = PC +1;
    PC = 0;
    ram[16] = 18;//10101
    ram[18] = 24;//10111
    ram[31] = 22;
    end

     always @(negedge clk) begin
        if(PCnew != 6'b000000)begin 
            PCnew = 0;
            
        end
        case(ins[31:26])
            6'b000000 : case(ins[5:0])
                            6'b100000 : begin
                                        ram[ins[15:11]] = (ram[ins[20:16]] + ram[ins[25:21]])<<ins[10:6];
                                        PC = PC +1; 
                                        $display("add",ram[ins[15:11]],ram[ins[20:16]],ram[ins[25:21]]);
                            end
                            6'b100001 : begin
                                        $display("addu");
                                        ram[ins[15:11]] = ($unsigned(ram[ins[20:16]]) + $unsigned(ram[ins[25:21]]))<<ins[10:6];
                                        PC = PC +1; 
                                        $display(ram[ins[15:11]],ram[ins[20:16]],ram[ins[25:21]]); 

                            end
                            6'b100010 : begin
                                         $display("sub");
                                        // ram[ins[15:11]] = ram[ins[25:21]] + ~ram[ins[20:16]] + 1;
                                        ram[ins[15:11]] = (ram[ins[25:21]] - ram[ins[20:16]])<<ins[10:6] ;
                                        PC = PC +1; 
                                        $display(ram[ins[15:11]],ram[ins[20:16]],ram[ins[25:21]]); 
                            end
                            6'b100011 : begin
                                         $display("subu");
                                         ram[ins[15:11]] =   ($unsigned(ram[ins[25:21]]) - $unsigned(ram[ins[20:16]]))<<ins[10:6] ;
                                        // ram[ins[15:11]] =   ram[ins[25:21]] - ram[ins[20:16]] ;
                                        PC = PC +1; 
                                        $display(ram[ins[15:11]],ram[ins[20:16]],ram[ins[25:21]]); 
                            end
                            6'b100100 : begin
                                         $display("and");
                                        ram[ins[15:11]] = (ram[ins[20:16]]&ram[ins[25:21]])<<ins[10:6] ;
                                        PC = PC +1; 
                                        $display(ram[ins[15:11]],ram[ins[20:16]],ram[ins[25:21]]); 
                            end
                            6'b100101 : begin
                                         $display("or");
                                        ram[ins[15:11]] = (ram[ins[20:16]]|ram[ins[25:21]])<<ins[10:6] ;
                                        PC = PC +1; 
                                        $display(ram[ins[15:11]],ram[ins[20:16]],ram[ins[25:21]]); 
                            end
                            6'b001000 :begin
                                        $display("jr");
                                        PC = ram[ins[15:11]];
                                        // PC = PC +1; 
                                        $display(ram[ins[15:11]],ram[ins[20:16]],ram[ins[25:21]],PC); 
                            end 
                            6'b101010 : begin
                                        $display("slt");
                                        PC = PC +1; 
                                        if(ram[ins[25:21]]<ram[ins[20:16]]) begin
                                        ram[ins[15:11]] = 6'b000001;
                                        end else begin
                                        ram[ins[15:11]] = 6'b000000;
                                        end
                                        $display(ram[ins[15:11]],ram[ins[20:16]],ram[ins[25:21]]); 

                            end
                            6'b000000 :begin
                                         $display("sll");
                                        PC = PC +1; 
                                         ram[ins[15:11]] = ram[ins[20:16]] << ins[15:6];   
                                       $display(ram[ins[15:11]],ram[ins[20:16]],ins[15:6]); 
                            end
                            6'b000010 :begin
                                        $display("srl");
                                        PC = PC +1; 
                                         ram[ins[15:11]] = ram[ins[20:16]] >> ins[15:6];   
                                       $display(ram[ins[15:11]],ram[ins[20:16]],ins[15:6]); 

                            end 
                        endcase
            6'b001000 : begin
                        $display("addi");
                         PC = PC +1; 
                        ram[ins[15:11]] = ram[ins[20:16]] + ins[15:0] ;
                        $display(ram[ins[15:11]],ram[ins[20:16]],ins[15:0]); 

            end
            6'b001001 : begin
                        $display("addiu");
                                        PC = PC +1; 
                        ram[ins[15:11]] = $unsigned(ram[ins[20:16]]) + $unsigned(ins[15:0]) ;
                        $display(ram[ins[15:11]],ram[ins[20:16]],ins[15:0]); 

            end
            6'b001100 : begin
                        $display("andi");
                                        PC = PC +1; 
                        ram[ins[15:11]] = ram[ins[20:16]]&ins[15:0] ;
                        $display(ram[ins[15:11]],ram[ins[20:16]],ins[15:0]); 

            end 
            6'b001101 : begin
                         $display("ori");
                                        PC = PC +1; 
                        ram[ins[15:11]] = ram[ins[20:16]]|ins[15:0] ;
                        $display(ram[ins[15:11]],ram[ins[20:16]],ins[15:0]); 

            end
            6'b100011 : begin
                         $display("lw");
                                        PC = PC +1; 
                        mem[ins[15:11]] <= ram[ins[20:0]];
                        $display(ram[ins[15:11]],ram[ins[20:0]]); 
            end
            6'b101011 : begin
                         $display("sw");
                        PC = PC +1; 
                        mem[ins[20:0]] <= ram[ins[15:11]];
                        $display(ram[ins[15:11]],ram[ins[20:0]]); 

            end
            6'b000100 :begin
                        $display("beq");
                        if(ram[ins[25:21]]==ram[ins[20:16]]) PC = PC + ins[5:0] +1;
                        else PC = PC +1; 
                        $display(PC,ins[5:0]);

            end 
            6'b000101 : begin
                        $display("bne");
                        // if(ram[ins[25:21]]==ram[ins[20:16]]) PC = PC + ins[5:0] +1;
                        // if(ram[ins[25:21]]!=ram[ins[20:16]]) PC = PC + ins[5:0] +1;
                         PC =  PC +1; 
                        $display(PC,ins[5:0]);

            end
            6'b000111 : begin
                        $display("bgt");
                        if(ram[ins[25:21]]>ram[ins[20:16]]) PC = PC + ins[5:0] +1;
                        else PC = PC + 1;
                        $display(PC,ins[5:0]);
            end
            6'b001111 : begin
                        $display("bgte");
                        if(ram[ins[25:21]]>=ram[ins[20:16]]) PC = PC + ins[5:0]+1;
                        else PC  = PC + 1;
                        $display(PC,ins[5:0]);
            end
            6'b000110 : begin
                        $display("ble");
                        if(ram[ins[25:21]]<ram[ins[20:16]]) PC = PC + ins[5:0]+ 1;
                        else PC =  PC +1; 
                        $display(PC,ins[5:0]);
            end
            6'b011111 : begin
                        $display("bleq");
                        if(ram[ins[25:21]]<=ram[ins[20:16]]) PCnew = PC + ins[5:0] + 1;
                        else PC = PC +1; 
                        $display(PC,ins[5:0]);
            end
            6'b000010 : begin
                         $display("j");
                        // PC = ins[5:0];
                        PC = 21; 
                        $display(PC,ins[5:0]);
            end
            6'b000011 : begin 
                        $display("jal");
                        // PC = ins[5:0];
                        PC = 23; 
                        ram[31] = {26'b0,temp[5:0]};
                        $display(PC,ins[5:0]);
            end
            6'b001010 :begin
                        $display("slti");
                        if(ram[ins[25:21]]<ins[5:0]) begin
                            ram[ins[20:16]] = 6'b000001;
                        end else begin
                            ram[ins[20:16]] = 6'b000000;
                        end
                        PC = PC +1; 
                        $display(ram[ins[15:11]],ram[ins[20:16]],ins[10:0]); 
            end
        endcase
        // $display(PC,PCnew);

     end
endmodule