`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:00:57 04/19/2017
// Design Name:   top_module
// Module Name:   E:/Development/OutlierDetection/Verilog/OD1/tb1.v
// Project Name:  OD1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb1;

	// Inputs
	reg clk;
	reg new_number;
	reg reset;
	reg [15:0] x;
	reg [15:0] y;

	// Outputs
	wire flag;

	// Instantiate the Unit Under Test (UUT)
	top_module uut (
		.clk(clk), 
		.new_number(new_number), 
		.reset(reset), 
		.x(x), 
		.y(y), 
		.flag(flag)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		new_number = 0;
		reset = 1;
		x = 0;
		y = 0;

		#300;
		new_number = 1;
		#300;
		new_number = 0;
		reset = 0;
		x = 1;
		y = 5;
		
		#2000;
		new_number = 1;
		#2000;
		new_number = 0;
		
		#3000;
		x = 2;
		y = 10;
		
		#2000;
		new_number = 1;
		#2000;
		new_number = 0;
		
		#3000;
		x = 3;
		y = 17;
		
		#2000;
		new_number = 1;
		#2000;
		new_number = 0;
		
		#3000;
		x = 4;
		y = 20;

		#2000;
		new_number = 1;
		#2000;
		new_number = 0;
		
		#3000;
		x = 5;
		y = 24;
		
		#2000;
		new_number = 1;
		#2000;
		new_number = 0;

		#3000;
		x = 6;
		y = 30;
		
		#2000;
		new_number = 1;
		#2000;
		new_number = 0;
		#3000;

		x = 7;
		y = 35;
		
		#2000;
		new_number = 1;
		#2000;
		new_number = 0;

		#3000;
		x = 8;
		y = 40;
		
		#2000;
		new_number = 1;
		#2000;
		new_number = 0;

		#3000;
		x = 9;
		y = 48;
		
		#2000;
		new_number = 1;
		#2000;
		new_number = 0;

		#3000;
		x = 10;
		y = 50;
		
		#2000;
		new_number = 1;
		#2000;
		new_number = 0;


		// Wait 100 ns for global reset to finish
		#100;
		
		
        
		// Add stimulus here

	end
	
	always #50 clk = ~clk;
      
endmodule
