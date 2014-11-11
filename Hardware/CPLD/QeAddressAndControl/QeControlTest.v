`timescale 1ns / 1ns

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
		.dtackl(dtackl), 
		.dsmcl(dsmcl), 
		.dbenl(dbenl), 
		.dbdir(dbdir), 
		.wizcsl(wizcsl), 
		.wizrdl(wizrdl), 
		.wizwrl(wizwrl),
		.wizrstl(wizrstl),
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		address = 10'h111;
		sp = 2'h0;
		asl = 1;
		dsl = 1;
		rdwl = 1;
		clk = 0;
	
		// Wait 100 ns for global reset to finish
		#100
		address = 10'h30e;
		rdwl = 0;
		asl = 0;
		#10
		dsl = 0;
		#10
		asl = 1;
		dsl = 1;
		#50;
		address = 10'h48;
		asl = 0;
		#50;
		dsl = 0;
		#50;
		dsl = 1;
		asl = 1;
		#50;
		address = 10'b1100100000;
		asl = 0;
		#50;
		dsl = 0;
		#50;
		dsl = 1;
		asl = 1;
		rdwl=1;
		#50;
		address = 10'b1100100000;
		asl = 0;
		#50;
		dsl = 0;
		#50;
		dsl = 1;
		asl = 1;
		#50;
		address = 10'b1100100100;
		asl = 0;
		rdwl=0;
		#50;
		dsl = 0;
		#50;
		dsl = 1;
		asl = 1;
		rdwl=1;
		#50;
		address = 10'h32f;
		asl = 0;
		#50;
		dsl = 0;
		#50;
		dsl = 1;
		asl = 1;
		#50
		address = 10'h30c;
		rdwl = 0;
		asl = 0;
		#50;
		dsl = 0;
		#50;
		dsl = 1;
		asl = 1;
		#50
		rdwl=1;
		#200
		rdwl = 0;
	end
   always begin
		#5 clk = ~clk;
	end
endmodule

