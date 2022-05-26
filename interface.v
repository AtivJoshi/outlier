`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:19:00 07/26/2017 
// Design Name: 
// Module Name:    interface 
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
module interface(x,clk, new_number, reset, flag);

input clk, new_number, reset;
output flag;
reg [7:0] addr;
wire [31:0] dout;
output [31:0] x;

//assign x = dout[24:16];
always @(posedge new_number)
begin
	if (reset == 1)
	begin
		addr = 0;
	end
	
	else
	begin
		addr = addr + 1;
	end
end

dataPoints dp (
  .clka(clk), // input clka
  .addra(addr), // input [7 : 0] addra
  .douta(dout) // output [31 : 0] douta
);

top_module tp(x,clk, new_number,reset,dout[31:16],dout[15:0],flag);
endmodule
