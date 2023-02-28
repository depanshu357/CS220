module float_adder(clk,match,given_ans,dataOut);
input clk;
output reg match;
output reg [31:0] given_ans;
output reg [31:0] dataOut;
reg [31:0]dataIn1;
reg [31:0]dataIn2;
reg [7:0] exp1;
reg [7:0] exp2;
reg [7:0] diff;
reg[24:0] num1;reg[24:0] num2;
reg [24:0] sum; reg [7:0] exp; reg sign;
initial begin
    // dataIn1[31:31] = 1'b0;
    // dataIn1[30:23] = 8'b10000001;
    // dataIn1[22:0] = 234;
    dataIn1 = 32'b0_1000_0010_01010000000000000000000;
    exp1 = dataIn1[30:23] - 127;

    // dataIn2[31:31] = 1'b0;
    // dataIn2[30:23] = 8'b10000011;
    // dataIn2[22:0] = 234;
    dataIn2 = 32'b0_1000_0010_10100000000000000000000;
    exp2 = dataIn2[30:23] - 127;

    given_ans = 32'b0_1000_0010_10111000000000000000000;

    num1 = {2'b01,dataIn1[30:23]};
    num2 = {2'b01,dataIn2[30:23]};
end

always @(posedge clk) begin
    // $monitor(match," ",ans_given," ",dataOut);
    if(exp1>exp2) begin
        diff = exp1 -exp2;
        num2 = num2>>diff;
        exp1 = exp1 + 127;
        if(dataIn1[31]==dataIn2[31]) begin
            sum = num1 + num2;
            sign = dataIn1[31];
            dataOut = {sign, exp1 , sum[22:0]};
        end 
        else begin
            if(exp1 == exp2) begin
              if(num1 >= num2) begin
                 sum = num1 - num2;
               end
              else begin
                sum = num2 - num1;
              end
            end
            while(sum[23]!=1'b1) begin
                sum = sum<<1;
                exp1 = exp1 -1;
            end
            dataOut = {sign, exp1 , sum[22:0]};
        end
    end
    else begin
        diff = exp2 - exp1;
        num1 = num1>>diff;
        exp2 = exp2 +127;
        if(dataIn1[31]==dataIn2[31]) begin
            sum = num1 + num2;
            sign = dataIn2[31];
            dataOut = {sign, exp2, sum[22:0]};
        end 
        else begin
            sum = num1 - num2;
                while(sum[23]!=1'b1) begin
                    sum = sum<<1;
                    exp2 = exp2 - 1;
                end
            dataOut = {sign, exp1 , sum[22:0]};
        end
    end
    match = (given_ans == dataOut);
end

endmodule