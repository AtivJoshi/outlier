`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:14:09 04/19/2017 
// Design Name: 
// Module Name:    top_module 
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
module top_module(beta_out,clk, new_number, reset, x, y, flag);
	input clk, new_number, reset;
	input [15:0] x, y;
	output reg flag;
	reg [31:0] b0_old, b1_old;
	reg [31:0] b0_new, b1_new;
	reg [31:0] n_times_mse;
	
	reg [31:0] b0_temp, b1_temp;
	
	wire [31:0] n_times_mse_wire;
	wire [31:0] beta0, beta1;
	
	//debug
	output [31:0] beta_out;
	assign beta_out = cdtemp; ///////////////////////debug
	wire [63:0] comp1, comp2;
	reg [31:0] b0, b1;
	
	reg [15:0] n;
	reg [15:0] sig_x;
	reg [15:0] sig_y;
	reg [31:0] sig_xy, sig_y2, sig_x2;
	
	wire [63:0] n_b0_2;
	wire [63:0] b0b1sigx;
	wire [63:0] sigx2_b1_2;
	
	wire [63:0] b0ext = (b0[31] == 1'b1) ? {32'H FFFFFFFF, b0} : {32'H 0, b0}; 
	wire [63:0] b1ext = (b1[31] == 1'b1) ? {32'H FFFFFFFF, b1} : {32'H 0, b1};
	
	wire [63:0] b0_old_ext = (b0_old[31] == 1'b1) ? {32'H FFFFFFFF, b0_old} : {32'H 0, b0_old}; 
	wire [63:0] b1_old_ext = (b1_old[31] == 1'b1) ? {32'H FFFFFFFF, b1_old} : {32'H 0, b1_old}; 
	wire [63:0] b0_new_ext = (b0_new[31] == 1'b1) ? {32'H FFFFFFFF, b0_new} : {32'H 0, b0_new}; 
	wire [63:0] b1_new_ext = (b1_new[31] == 1'b1) ? {32'H FFFFFFFF, b1_new} : {32'H 0, b1_new}; 
	wire [63:0] b0ext_2 = b0_old_ext*b0_old_ext + b0_new_ext*b0_new_ext - 2*b0_new_ext*b0_old_ext; 
	wire [63:0] b1ext_2 = b1_old_ext*b1_old_ext + b1_new_ext*b1_new_ext - 2*b1_new_ext*b1_old_ext; 
	
	assign n_b0_2 = n*b0ext_2;
	assign b0b1sigx = (b0ext*b1ext*sig_x)<<1;
	
	assign sigx2_b1_2 = b1ext_2*sig_x2;
	
	wire [31:0] cdtemp;
	assign cdtemp = n_b0_2[47:16] + (b0b1sigx[47:16]) + sigx2_b1_2[47:16];
	wire [63:0] cdtempext = (cdtemp[31] == 1'b1) ? {32'H FFFFFFFF, cdtemp} : {32'H 0, cdtemp}; 
	
	assign comp1 = (cdtemp*(n-2)*n);
	assign comp2 = (n_times_mse<<3);
	
	always @(posedge new_number)
	begin
		if(reset==0)
		begin
			b0_old = b0_new;
			b1_old = b1_new;
			n = n+1;
			sig_x = sig_x + x;
			sig_y = sig_y + y;
			sig_xy = sig_xy + (x*y);
			sig_x2 = sig_x2 + (x*x);
			sig_y2 = sig_y2 + (y*y);
		end
		else
		begin
			n = 0;
			sig_x = 0;
			sig_y = 0;
			sig_xy = 0;
			sig_x2 = 0;
			sig_y2 = 0;
			b0_old = 0;
			b1_old = 0;
		end
	end
	always @(posedge clk)
	begin
		if(reset==0)
		begin
			b0_temp = b0_new;
			b1_temp = b1_new;
			b0_new = beta0;
			b1_new = beta1;
			b0 = b0_new - b0_old;
			b1 = b1_new - b1_old;
			n_times_mse = n_times_mse_wire;
			//if(comp1>comp2 && !new_number && b0_temp == b0_new && b1_temp == b1_new)
			if(comp1>comp2)
				flag = 1'b1;
			else
				flag = 1'b0;
		end
		else
		begin
			b0_new = 0;
			b1_new = 0;
			b0 = 0;
			b1 = 0;
			flag = 0;
			n_times_mse = 0;
		end
	end
			
	beta calc_beta(n, sig_x, sig_y, sig_xy, sig_x2, sig_y2, 1'b1, new_number, clk, beta0, beta1, n_times_mse_wire);
	
endmodule
