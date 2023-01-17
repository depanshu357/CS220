module not_gate_tb;
wire t_y;
reg t_a;
not_gate mygate(.a(t_a),.y(t_y));

initial begin
    $monitor(t_a, t_y);
    t_a=1'b0;
    #10;
    t_a=1'b1;
end

endmodule