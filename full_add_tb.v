`timescale 1ns/1ns
module full_add_tb;
reg t_a1,t_a2,t_a3,t_a4,t_b1,t_b2,t_b3,t_b4;
wire t_out1,t_out2,t_out3,t_out4,t_crr1,t_crr2,t_crr3,t_crr4;
full_add my_add(t_a1,t_a2,t_a3,t_a4,t_b1,t_b2,t_b3,t_b4,t_out1,t_out2,t_out3,t_out4,t_crr1,t_crr2,t_crr3,t_crr4);
initial begin
    $dumpfile("full_add_tb.vcd");
    $dumpvars(0,full_add_tb);
  $monitor(t_a1,t_a2,t_a3,t_a4,t_b1,t_b2,t_b3,t_b4,t_out1,t_out2,t_out3,t_out4,t_crr1,t_crr2,t_crr3,t_crr4);
  t_a1=1'b0;t_a2=1'b1;t_a3=1'b1;t_a4=1'b0;t_b1=1'b1;t_b2=1'b1;t_b3=1'b0;t_b4=1'b1;
  #5;
  t_a1=1'b0;t_a2=1'b1;t_a3=1'b0;t_a4=1'b0;t_b1=1'b0;t_b2=1'b0;t_b3=1'b0;t_b4=1'b1;
  #5;
  t_a1=1'b1;t_a2=1'b0;t_a3=1'b0;t_a4=1'b0;t_b1=1'b1;t_b2=1'b0;t_b3=1'b1;t_b4=1'b1;
  #5;
  t_a1=1'b0;t_a2=1'b0;t_a3=1'b0;t_a4=1'b0;t_b1=1'b1;t_b2=1'b1;t_b3=1'b1;t_b4=1'b1;
  #5;
  $display("Test completed");
end
endmodule