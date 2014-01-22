`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:33:55 02/26/2012
// Design Name:   i2c
// Module Name:   D:/ql/W5300-for-QL/Hardware/CPLD/QeDebug/i2cTest.v
// Project Name:  QeDebug
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: i2c
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module i2cTest;

	// Inputs
	reg clk;

	// Outputs
	wire sck;
	wire sda;

	// Instantiate the Unit Under Test (UUT)
	i2c uut (
		.clk(clk), 
		.sck(sck), 
		.sda(sda)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here

	end
	
	always #1 clk = ~clk;
      
endmodule

