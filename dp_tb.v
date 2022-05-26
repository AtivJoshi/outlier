`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:22:11 07/28/2017
// Design Name:   dataPoints
// Module Name:   C:/Users/student/Downloads/OD1/OD1/dp_tb.v
// Project Name:  OD1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dataPoints
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dp_tb;

	// Inputs
	reg clka;
	reg [7:0] addra;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	dataPoints uut (
		.clka(clka), 
		.addra(addra), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		addra = 0;
		// Wait 100 ns for global reset to finish
		#100;
		addra = 1;
      #100;
		addra = 2;
      #100;
		addra = 3;
      #100;
		addra = 4;
      #100;
		addra = 1;
      #100;
		addra = 1;
      #100;
		addra = 1;
      #100;
		addra = 1;
        
		// Add stimulus here
		

	end
	always #50 clka = ~clka;

      
endmodule

