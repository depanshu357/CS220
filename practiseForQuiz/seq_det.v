module seq_det(clk,rst,req,gnt);
input clk,rst,req;
output reg gnt;
parameter SIZE = 3;
reg [SIZE-1:0] next_state;
reg [SIZE-1:0] state;
parameter IDLE = 3'b000, STATE1 = 3'b001,STATE2= 3'b011,STATE3=3'b110;
// to detect sequence of 110
always @(req or state) begin
    case(state)
        IDLE: if(req==1'b1) begin
            next_state <= STATE1;
        end else begin
            next_state <= IDLE;
        end
        STATE1: if(req==1'b1) begin
            next_state<=STATE2;
        end else begin
            next_state<=IDLE;
        end
        STATE2: if(req==1'b0) begin
            next_state<=STATE3;
        end else begin
            next_state<=STATE2;
        end
        STATE3: if(req==1'b1) begin
            next_state<=STATE1;
        end else begin
            next_state<=IDLE;
        end
        default : next_state<= IDLE;
    endcase

end
always @(posedge clk ) begin
    if(rst==1'b1) begin
        state <= IDLE;
        next_state <= IDLE;
    end else begin
        state <= next_state;
    end
end

always @(posedge clk ) begin
    if(rst) begin
        gnt <= 1'b0;
    end else if(state==3'b110) begin
            gnt <= 1'b1;
        end else begin
            gnt <= 1'b0;
        end
    
end

endmodule