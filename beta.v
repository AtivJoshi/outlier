`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:14:21 04/19/2017 
// Design Name: 
// Module Name:    beta 
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
module beta(n, sig_x, sig_y, sig_xy, sig_x2, sig_y2, en, start, clk, beta0, beta1, n_times_mse_wire);
	input [15:0] n/*16,0*/;
	input [15:0] sig_x/*32,0*/, sig_y/*32,0*/;
	input [31:0] sig_xy/*64,0*/, sig_x2/*64,0*/, sig_y2/*64,0*/;
	output [31:0] beta0, beta1;/*16,16*/
	output [31:0] n_times_mse_wire;
	input en,clk,start; //
	
	wire [63:0] det;/*80,0*/
	wire [31:0] det_inv;/*0,32*/
	wire [31:0] beta0_times_det;//96,0
	wire [31:0] beta1_times_det;/*80,0*/
	wire [31:0] beta0_temp;//96,0
	wire [31:0] beta1_temp;/*80,0*/
	
	reg [5:0] countIter = 1'b0;
	wire o_complete0, o_overflow0;
	wire o_complete1, o_overflow1;
	//wire [64:0] i11/*32,0*/,i12/*32,0*/,i22/*32,0*/;
		
	//assign i11 = (en==0)?0:sig_x2;/*24,8*/
	//assign i12 = (en==0)?0:sig_x;/*16,0*/
	//assign i22 = (en==0)?0:n;/*16,0*/
	
	assign det = (en==0)?1:(n*sig_x2 - (sig_x*sig_x))/*16+64 - 32*32 *//*80,0*/;
	
	assign beta0_times_det = (en==0)?1:(sig_x2*sig_y - sig_x*sig_xy)/*64+32 - 32+64*//*96,0*/;
	assign beta1_times_det = (en==0)?1:(n*sig_xy - sig_x*sig_y)/*16+64 - 32+32*//*80,0*/;

//	qdiv #(16,32) ([N-1:0] i_dividend, [N-1:0] i_divisor,i_start, i_clk,[N-1:0] o_quotient_out, o_complete, o_overflow)
	qdiv #(16,32) q0 (beta0_times_det[31:0], det[31:0], start, clk, beta0[31:0], o_complete0, o_overflow0);
	qdiv #(16,32) q1 (beta1_times_det[31:0], det[31:0], start, clk, beta1[31:0], o_complete1, o_overflow1);
		
	always @(posedge clk)
	begin
		countIter = countIter + 1;
	end

	
	always @(posedge o_complete0)
	begin
		countIter = 0;
		//beta0 = beta0_temp;
	end
//	always @(posedge o_complete1)
	//	beta1 = beta1_temp;
	
	nMSE calc_mse(n, sig_x, sig_y, sig_xy, sig_x2, sig_y2, beta0, beta1, n_times_mse_wire);

/*
	inverse det_inverse(clk, reset, det, det_inv);
	
	assign beta0_times_det = (en==0)?1:(sig_x2*sig_y - sig_x*sig_xy)/*64+32 - 32+64*//*96,0*/;
/*	assign beta1_times_det = (en==0)?1:(n*sig_xy - sig_x*sig_y)/*16+64 - 32+32*//*80,0*/;
/*
	assign beta0_temp = (beta0_times_det * det_inv)>>16;
	assign beta1_temp = (beta1_times_det * det_inv)>>16;

	assign beta0 = beta0_temp[31:0];
	assign beta1 = beta1_temp[31:0];
*/
endmodule