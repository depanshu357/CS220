module block_and_non_block(a,b,c);
input  c;
reg c_reg ;
output reg b,a;
reg temp;
initial begin
    c_reg = 0;
     temp = 1;
    a = 0;b= 0;
end
    always @(temp) begin
        // c = 1;
         temp = 0;
        c_reg<=1;
        a <= c_reg;
        b = c_reg;
        $display(a," ",b," ",c);
    end

endmodule