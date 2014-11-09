`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:12:41 11/09/2014
// Design Name:   W5300Reset
// Module Name:   D:/ql/W5300-for-QL/Hardware/CPLD/QeAddressAndControl/ResetTest.v
// Project Name:  QeAddressAndControl
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: W5300Reset
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ResetTest;

	// Inputs
	reg clk;
	reg trigger_reset;

	// Outputs
	wire w5300_resetl;

	// Instantiate the Unit Under Test (UUT)
	W5300Reset uut (
		.clk(clk), 
		.trigger_reset(trigger_reset), 
		.w5300_resetl(w5300_resetl)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		trigger_reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		trigger_reset = 1;
		#10;
		trigger_reset = 0;

	end
   always begin
		#5 clk = ~clk;
	end

endmodule

