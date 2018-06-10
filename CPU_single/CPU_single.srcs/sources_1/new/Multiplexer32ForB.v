`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/21 17:41:35
// Design Name: 
// Module Name: Multiplexer32ForB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Multiplexer32ForB(
    input select,
    input [31:0]DataIn1,
    input [31:0]DataIn2,
    output [31:0]DataOut
    );
    
    assign DataOut = select ? DataIn2 : DataIn1;
endmodule