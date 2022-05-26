`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:55:19 04/19/2017 
// Design Name: 
// Module Name:    inverse 
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
module inverse(clk, reset, D, X);

	input [63:0] D;
	output reg signed [31:0] X;
	input clk ,reset;
	
	//x(2-dx)
	reg signed [95:0] temp1;//D*X(80,32)
	wire signed [95:0] two_cons;//2(80,32)
	reg signed [95:0] temp2;//2-D*X(80,32)
	reg signed [127:0] temp3;//X(2-D*X) (0,32 * (80,32))
									//80,64

	assign two_cons = 96'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0010_0000_0000_0000_0000_0000_0000_0000_0000;

	//////////////////////////////////////
	always @(posedge clk)
	begin
		 if (reset==1'b1)
			 X <= 32'b0000_0000_0000_0000_0000_0000_0100_0000;
		 else
			 X <= temp3[63:32];
	end


	////////////////////////////////////////
	always @(*)
	begin
		temp1 = D*X; //////   [11:8,7:0]x[11:8,7:0]=[63:32,31:0]
		temp2 = two_cons - temp1; //////[63:32,31:0]
		temp3 = X*temp2; /////     [11:8,7:0]x[23:16,15:0]=[95:64,63:0]
	end
	/////////////////////////////////////////////////////////////////


endmodule