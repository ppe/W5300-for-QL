`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Petri Pellinen
// 
// Create Date:    21:46:41 11/27/2010 
// Design Name: 
// Module Name:    QeControl 
// Project Name: QL Ethernet card
// Target Devices: XC9536
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
// synthesis attribute BUFG of clk is CLK;
module QeControl(
    input [9:0] address,
	 input [3:0] sp,
    input asl,
    input dsl,
    input rdwl,
	 input clk,
    output reg dtackl,
    output dsmcl,
    output reg dbenl,
    output dbdir,
    output reg wizcsl,
    output reg wizrdl,
    output reg wizwrl,
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
	 
	assign expansionAddress = (address[9:8] == 2'b00);
	assign cardAddressActive = (address[7:4] == 4'b0100) && expansionAddress && !asl;
	assign wiznetAddressActive = cardAddressActive && address[3:0] == 4'b1000;
	assign resetRequested = cardAddressActive && address[3:0] == 4'b1100 && rdwl == 0;
	assign dsmcl = cardAddressActive;
	assign dbdir = rdwl;
	assign trigger_wiz_reset = resetRequested && !asl;
	always @(posedge clk) begin
		dtackl = !( cardAddressActive && !dsl );
		dbenl = !(wiznetAddressActive && !dsl);
		wizcsl = !(wiznetAddressActive && !dsl);
		wizrdl = !(wiznetAddressActive && !dsl && rdwl);
		wizwrl = !(wiznetAddressActive && !dsl && !rdwl);
	end
endmodule
