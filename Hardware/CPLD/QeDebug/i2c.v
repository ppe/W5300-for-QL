`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:36 02/26/2012 
// Design Name: 
// Module Name:    i2c 
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
module i2c(
    input clk,
    output sck,
    output sda
    );
	reg [1:0] cnt = 2'h0;
	reg [1:0] state = 2'h0;
	wire dclk;
	wire clkup;
	assign sda = 0;
	assign sck = clkup;
	assign clkup = (cnt == 2'h3);
	
	always @(posedge clk) begin
		if (cnt == 2'h3)
			cnt = 2'b0;
		else
			cnt = cnt + 1;
		
	end
endmodule
