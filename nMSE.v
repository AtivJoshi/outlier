`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:36:25 04/19/2017 
// Design Name: 
// Module Name:    nMSE 
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
module nMSE(n, sig_x, sig_y, sig_xy, sig_x2, sig_y2, beta0, beta1, n_times_mse);
	input [15:0] n;
	input [15:0] sig_x;
	input [15:0] sig_y;
	input [31:0] sig_xy, sig_y2, sig_x2;
	input [31:0] beta0;
	input [31:0] beta1;
	
	output [31:0] n_times_mse;
	
	wire [31:0] yy;
	wire [31:0] yxb;
	wire [31:0] bxy;
	wire [31:0] bxxb;
	wire [63:0] beta0ext = (beta0[31] == 1'b1) ? {32'H FFFFFFFF, beta0} : {32'H 0, beta0}; 
	wire [63:0] beta1ext = (beta1[31] == 1'b1) ? {32'H FFFFFFFF, beta1} : {32'H 0, beta1}; 
	wire [63:0] beta0_2_temp = beta0ext*beta0ext;//32,32
	wire [63:0] beta1_2_temp = beta1ext*beta1ext;
	wire [63:0] beta0_beta1_temp = beta0ext*beta1ext;
	wire [31:0] beta0_2 = beta0_2_temp[47:16];//32,32
	wire [31:0] beta1_2 = beta1_2_temp[47:16];
	wire [31:0] beta0_beta1 = beta0_beta1_temp[47:16];
	
	assign yy = sig_y2<<16;
	assign yxb = (beta0*sig_y)+(beta1*sig_xy);//48,16
	assign bxy = (beta0*sig_y)+(beta1*sig_xy);
	assign bxxb = (beta0_2*n) + ((beta0_beta1*sig_x)<<1) + (beta1_2*sig_x2);//32,32
	//assign bxxb = (beta0_beta1*sig_x);
		
	/* mse = (1/n)*(y'y - y'xb - b'x'y + b'x'xb) */
	//assign n_times_mse = sig_y2<<16 - (2 * ((beta0*sig_y)+(beta1*sig_xy))) + (((beta0*beta0*n) + (2*(beta0*beta1*sig_x)) + (beta1*beta1*sig_x2)));
	assign n_times_mse = yy - yxb - bxy + bxxb;
	/*64+16 - (48,16 + 80,16) + (48,32 + 64,32 + 64,32)>>16*/
endmodule
