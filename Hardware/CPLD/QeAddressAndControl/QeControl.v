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
module QeControl(
    input [11:0] address,
    input asl,
    input dsl,
    input rdwl,
    output dtackl,
    output dsmcl,
    output gate7seg,
    output dbenl,
    output dbdir,
    output wizcsl,
    output wizrdl,
    output wizwrl
    );
wire sevenSegAddressMatch;
wire wiznetAddressMatch;
assign sevenSegAddressMatch = ( (address == 12'h183) && !asl);
assign wiznetAddressMatch = ( ((address < 12'h194) && (address >= 12'h190)) && !asl);
assign dtackl = ( !dbenl && !dsl ) ? 0 : 1'bZ ;
assign dsmcl = ((sevenSegAddressMatch || wiznetAddressMatch) && !asl) ? 1 : 1'bZ;
assign gate7seg = sevenSegAddressMatch && !dsl;
assign dbenl = !( sevenSegAddressMatch || wiznetAddressMatch );
assign dbdir = !rdwl;
assign wizcsl = !(wiznetAddressMatch && !dsl);
assign wizrdl = !rdwl;
assign wizwrl = rdwl;
endmodule
