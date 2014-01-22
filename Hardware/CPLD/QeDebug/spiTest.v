`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:42:05 03/05/2012
// Design Name:   spi
// Module Name:   D:/ql/W5300-for-QL/Hardware/CPLD/QeDebug/spiTest.v
// Project Name:  QeDebug
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: spi
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module spiTest;

	// Inputs
	reg clk;
	reg [1:0] operation;
	reg reset;

	// Outputs
	wire oel;
	wire [1:0] shiftMode;
	wire spi_clk;
	wire e48_csl;
	wire e48_hold;

	// Instantiate the Unit Under Test (UUT)
	spi uut (
		.clk(clk), 
		.operation(operation), 
		.reset(reset), 
		.oel(oel), 
		.shiftMode(shiftMode), 
		.spi_clk(spi_clk), 
		.e48_csl(e48_csl), 
		.e48_hold(e48_hold)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		operation = 0;
		reset = 1;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		reset = 0;
		#1;
		reset = 1;
		#1;
		operation = 3;
		#2;
		operation = 0;
		#2;
		operation = 3;
		#2;
		operation = 0;
		#14;
		operation = 1;
		#2;
		operation = 0;
	end
	
	always #1 clk = ~clk;
      
endmodule

