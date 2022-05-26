`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:10:08 07/28/2017
// Design Name:   interface
// Module Name:   C:/Users/student/Downloads/OD1/OD1/tb2.v
// Project Name:  OD1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: interface
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb2;

	// Inputs
	reg clk;
	reg new_number;
	reg reset;

	// Outputs
	wire flag;

	// Instantiate the Unit Under Test (UUT)
	interface uut (
		.clk(clk), 
		.new_number(new_number), 
		.reset(reset), 
		.flag(flag)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		new_number = 0;
		reset = 1;
		
		#300;
		new_number = 1;
		#300;
		new_number = 0;
		reset = 0;
		
		#2000;
		new_number = 1;
		#2000;
		new_number = 0;
		
		#3000;
		
		#20000;
		new_number = 1;
		#2000;
		new_number = 0;
		
		#3000;
		
		#20000;
		new_number = 1;
		#2000;
		new_number = 0;
		
		#3000;
		
		#20000;
		new_number = 1;
		#2000;
		new_number = 0;
		
		#3000;
		
		#20000;
		new_number = 1;
		#2000;
		new_number = 0;

		#3000;
		
		#20000;
		new_number = 1;
		#2000;
		new_number = 0;
		#3000;

		
		#20000;
		new_number = 1;
		#2000;
		new_number = 0;

		#3000;
		
		#20000;
		new_number = 1;
		#2000;
		new_number = 0;

		#3000;
		
		#20000;
		new_number = 1;
		#2000;
		new_number = 0;

		#3000;
		
		#20000;
		new_number = 1;
		#2000;
		new_number = 0;


		// Wait 100 ns for global reset to finish
		#100;
		
		
        
		// Add stimulus here

	end
	
	always #50 clk = ~clk;
      
	
      
endmodule

