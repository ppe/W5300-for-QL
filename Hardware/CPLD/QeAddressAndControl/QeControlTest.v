`timescale 1us / 1us

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:58:54 11/27/2010
// Design Name:   QeControl
// Module Name:   D:/MyData/xilinx/QeAddressAndControl/QeControlTest.v
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

module QeControlTest;

	// Inputs
	reg [11:0] address;
	reg asl;
	reg dsl;
	reg rdwl;

	// Outputs
	wire dtackl;
	wire dsmcl;
	wire gate7seg;
	wire dbenl;
	wire dbdir;
	wire wizcsl;
	wire wizrdl;
	wire wizwrl;

	// Instantiate the Unit Under Test (UUT)
	QeControl uut (
		.address(address), 
		.asl(asl), 
		.dsl(dsl), 
		.rdwl(rdwl), 
		.dtackl(dtackl), 
		.dsmcl(dsmcl), 
		.gate7seg(gate7seg), 
		.dbenl(dbenl), 
		.dbdir(dbdir), 
		.wizcsl(wizcsl), 
		.wizrdl(wizrdl), 
		.wizwrl(wizwrl)
	);

	initial begin
		// Initialize Inputs
		address = 0;
		asl = 1;
		dsl = 1;
		rdwl = 1;

		// Wait 100 ns for global reset to finish
		#50;
		address = 12'h183;
		asl = 0;
		#50;
		dsl = 0;
		#50;
		dsl = 1;
		asl = 1;
		#50;
		asl = 0;
		rdwl = 0;
		#50;
		dsl = 0;
		#50;
		dsl = 1;
		asl = 1;
		#50;
		address = 12'h192;
		asl = 0;
		#50;
		dsl = 0;
		#50;
		asl = 1;
		dsl = 1;
		#50;
		address = 12'h194;
		asl = 1;
		rdwl = 1;
		#50;
		dsl = 0;
		#50;
		dsl = 1;
		asl = 1;
		#50;
		address = 12'h191;
		asl = 0;
		rdwl = 1;
		#50;
		dsl = 0;
		#50;
		dsl = 1;
		asl = 1;
	end
      
endmodule

