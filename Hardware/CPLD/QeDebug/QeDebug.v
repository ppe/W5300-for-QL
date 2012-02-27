`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:52 02/05/2012 
// Design Name: 
// Module Name:    QeDebug 
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
module QeDebug(
		input [9:0] address,
		input asl,
		input dsl,
		input rdwl,
		input clk,
		output dbdir,
		output dbenl,
		output dtackl,
		output dsmcl,
		output wizcsl,
		output wizrdl,
		output wizwrl,
		output wizrstl
   );
	wire expansionAddress;
	wire cardAddressActive;
	wire wiznetAddressActive;
	wire resetAddressActive;
	wire trigger_wiz_reset;

	 W5300Reset w_reset (
		.clk(clk),
		.trigger_reset(trigger_wiz_reset),
		.w5300_resetl(wizrstl)
	 );

	assign expansionAddress = address[9:8] == 2'h3;
	assign cardAddressActive = address[7:4] == 4'h1 && expansionAddress && !asl;
	assign wiznetAddressActive = cardAddressActive && address[3:0] == 4'hf;
	assign resetRequested = cardAddressActive && address[3:0] == 4'he && rdwl == 0;
	assign dsmcl = cardAddressActive;
   assign dbdir = rdwl;
	assign dbenl = !cardAddressActive;
	assign dtackl = ( !dbenl && !dsl ) ? 0 : 1;
	assign wizcsl = !(wiznetAddressActive && !dsl);
	assign wizrdl = !rdwl;
	assign wizwrl = rdwl;
	assign trigger_wiz_reset = resetRequested;
endmodule
