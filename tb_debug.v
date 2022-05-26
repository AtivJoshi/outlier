`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:29:27 08/01/2017
// Design Name:   interface
// Module Name:   C:/Users/student/Downloads/OD1/OD1/tb_debug.v
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

module tb_debug;

	// Inputs
	reg clk;
	reg new_number;
	reg reset;

	// Outputs
	wire [31:0] x;
	wire flag;

	// Instantiate the Unit Under Test (UUT)
	interface uut (
		.x(x), 
		.clk(clk), 
		.new_number(new_number), 
		.reset(reset), 
		.flag(flag)
	);
	integer i;
	integer k;
	real x_fp;
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
		
		
		for(i=0;i<250;i=i+1)
		begin
			#3000;
			new_number = 1;
			#2000;
			new_number = 0;			
			#3000;
			
		end
		


		// Wait 100 ns for global reset to finish
		#100;
		
		
        
		// Add stimulus here

	end
	
	always@(posedge clk)
	begin
	/*
			if(x[16] == 1)
			begin
				x_fp = 1;
			end
			else
			begin
				x_fp= 0;
			end
			
			for(k=16;k<32;k=k+1)
			begin
				
			end*/
			
			x_fp = 16*x[20] + 8*x[19] + 4*x[18] + 2*x[17] + x[16] + 0.5*x[15] + 0.25*x[14] + 0.125*x[13] + 0.0625*x[12] + 0.03125*x[11] + 0.015625*x[10];
			
			
	end
	
	
	always #50 clk = ~clk;
	
endmodule
