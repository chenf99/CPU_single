`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/20 16:41:42
// Design Name: 
// Module Name: Multiplexer32For2
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


module Multiplexer32ForA(       //用于选择ALU的第一个输入的2选1选择器
    input select,
    input [31:0]DataIn1,
    input [4:0]DataIn2,			//输入的sa只有5位，要做0扩展
    output [31:0]DataOut
    );
    
	wire [31:0]extendSa;
	assign extendSa[31:5] = 0;
	assign extendSa[4:0] = DataIn2;
	
    assign DataOut = select ? extendSa : DataIn1;
endmodule
