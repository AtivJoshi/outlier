`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:45:30 08/02/2017 
// Design Name: 
// Module Name:    multiplication 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module multiplication(a, b, c, a1, b1, c1, clk);
	input [31:0] a,b,a1, b1;
	input clk;
	output [63:0] c, c1;
	
	assign c = a*b;
	
	mul mul1 (
  .clk(clk), // input clk
  .a(a1), // input [31 : 0] a
  .b(b1), // input [31 : 0] b
  .p(c1) // output [63 : 0] p
);
endmodule
