`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:06:46 11/16/2014
// Design Name:   QeControl
// Module Name:   D:/ql/W5300-for-QL/Hardware/CPLD/QeAddressAndControl/DtackTest.v
// Project Name:  QeAddressAndControl
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: QeControl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DtackTest;

	// Inputs
	reg [9:0] address;
	reg [3:0] sp;
	reg asl;
	reg dsl;
	reg rdwl;
	reg clk;

	// Outputs
	wire dtackl;
	wire dsmcl;
	wire dbenl;
	wire dbdir;
	wire wizcsl;
	wire wizrdl;
	wire wizwrl;
	wire wizrstl;

	// Instantiate the Unit Under Test (UUT)
	QeControl uut (
		.address(address), 
		.sp(sp), 
		.asl(asl), 
		.dsl(dsl), 
		.rdwl(rdwl), 
		.clk(clk), 
		.dtackl(dtackl), 
		.dsmcl(dsmcl), 
		.dbenl(dbenl), 
		.dbdir(dbdir), 
		.wizcsl(wizcsl), 
		.wizrdl(wizrdl), 
		.wizwrl(wizwrl), 
		.wizrstl(wizrstl)
	);

	initial begin
		// Initialize Inputs
		address = 10'bZ;
		sp = 0;
		asl = 1;
		dsl = 1;
		rdwl = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		address = 10'b0001001000;
		#5;
		asl = 0;
		dsl = 0;
		#25;
		dsl = 1;
		asl = 1;
		#5;
		address = 10'bZ;
		// Write cycle
		#5;
		address = 10'b0001001000;
		#5;
		asl = 0;
		rdwl = 0;
		#10;
		dsl = 0;
		#15;
		asl = 1;
		dsl = 1;
		#5;
		address = 10'bZ;
		rdwl = 1;
		
	end
   always begin
		#5 clk = ~clk;
	end
      
endmodule

