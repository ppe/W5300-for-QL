`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:01:56 03/05/2012 
// Design Name: 
// Module Name:    spi 
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
module spi(
    input clk,
    input [1:0] operation,
	 input reset,
    output oel,
    output [1:0] shiftMode,
    output spi_clk,
    output e48_csl,
    output e48_hold
    );

reg [1:0] mode;
reg [3:0] counter;
reg [1:0] s;

assign spi_clk = ~(mode == 2'b00) & clk;
assign shiftMode = s;
assign oel = ~(mode == 2'b01);
assign e48_csl = ~(mode == 2'b11);
assign e48_hold = ~e48_csl;

always @(negedge reset) begin
  counter = 0;
  mode = 0;
  s = 0;
end

always @(posedge clk) begin
	if((mode == 2'b11) && ~(counter == 8)) begin
		counter <= counter + 1;
	end
	else
	if((mode == 2'b11) && (counter == 8)) begin
		mode <= 0;
		counter <= 0;
	end
end

always @(negedge clk) begin
	if(operation == 2'b11 && mode == 0) begin
		mode <= 2'b11;
		s <= 1; // Shift right
	end
	else
	if(operation == 2'b01 && mode == 0) begin
		mode <= 2'b01;
	end
	else
	if(mode == 2'b01) begin
		mode <= 2'b00;
	end
end
endmodule
