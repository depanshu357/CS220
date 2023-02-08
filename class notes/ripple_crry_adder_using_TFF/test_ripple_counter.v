`timescale 1ns / 1ps
`include "ripple_counter.v"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:08:04 01/11/2023
// Design Name:   ripple_carry_counter
// Module Name:   /home/ise/vm_share/Lecture_3_examples/test_ripple_counter.v
// Project Name:  Lecture_3_examples
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ripple_carry_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ripple_counter;

	// Inputs
	reg clk;
	reg reset_outer;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	ripple_counter uut (
		.q(q), 
		.clk(clk),
		.reset_outer(reset_outer)
		
	);

	initial begin
	clk<=0;
	forever #1 clk<=~clk;
	end
	
	initial begin
		$dumpfile("test_ripple_counter.vcd");
		$dumpvars(0,test_ripple_counter);
		$monitor("%d %d",q,reset_outer);
		// Initialize Inputs
		clk = 0; 
		reset_outer = 0;#100;
		clk =1;
		reset_outer = 0;#100;
		clk =0;
		reset_outer = 0;#100;
		clk = 1;
		reset_outer = 0;#100;
		reset_outer = 1;#100;

		// Wait 100 ns for global reset_outer to finish
		// Add stimulus here
		
		$finish;
	end
      
endmodule

