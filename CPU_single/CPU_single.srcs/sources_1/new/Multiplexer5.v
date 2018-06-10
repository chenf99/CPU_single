`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/20 16:35:36
// Design Name: 
// Module Name: Multiplexer5
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


module Multiplexer5(    //用于选择5位结果的二选一多路复用器
    input RegDst,       //2选1选择信号
    input [4:0]DataIn1,
    input [4:0]DataIn2,
    output [4:0]DataOut
    );
    
    assign DataOut = RegDst ? DataIn2 : DataIn1;
endmodule
