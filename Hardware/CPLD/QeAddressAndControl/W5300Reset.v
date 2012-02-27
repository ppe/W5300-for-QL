`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:15:34 02/02/2012 
// Design Name: 
// Module Name:    W5300Reset 
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
module W5300Reset(
	clk,
	trigger_reset,
	w5300_resetl
 );

	input clk;
	input trigger_reset;
	output w5300_resetl;

	reg [7:0] count = 8'hb0;
	wire counting;

	assign w5300_resetl = ~counting;
	assign counting = ~(count == 8'hb0);
	always @(posedge clk or posedge trigger_reset)
	begin
		if (trigger_reset) begin
			count = 0;
		end
		else if (counting) begin
			count = count + 1;
		end
	end
endmodule

