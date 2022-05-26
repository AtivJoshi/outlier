`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:50:34 08/02/2017
// Design Name:   multiplication
// Module Name:   C:/Users/student/Downloads/OD1/OD1/tb_mul.v
// Project Name:  OD1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiplication
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_mul;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [31:0] a1;
	reg [31:0] b1;
	reg clk;

	// Outputs
	wire [63:0] c;
	wire [63:0] c1;

	// Instantiate the Unit Under Test (UUT)
	multiplication uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.a1(a1), 
		.b1(b1), 
		.c1(c1), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs

		a = 64'H 0000_0003_0b12_7d11;
		b = 385;
		a1 = 64'H 0000_0003_0b12_7d11;
		b1 = 385;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		a = 64'H 0F0F_0003_0b12_7d11;
		b = 64'H 0F0F_0003_0b12_7d11;
		a1 = 64'H 0F0F_0003_0b12_7d11;
		b1 = 64'H 0F0F_0003_0b12_7d11;        
		// Add stimulus here

	end

always #50 clk = ~clk;      
endmodule

