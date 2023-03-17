module DFF(q,d,clk,rst);
input d,clk,rst;
output q;
reg     q ;
always @(negedge(clk) or posedge(rst)) begin
    if(rst == 1'b1) begin
        q<=1'b0;
    end 
    else begin
        q <= d;
    end
end
endmodule