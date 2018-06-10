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


module Multiplexer32ForA(       //����ѡ��ALU�ĵ�һ�������2ѡ1ѡ����
    input select,
    input [31:0]DataIn1,
    input [4:0]DataIn2,			//�����saֻ��5λ��Ҫ��0��չ
    output [31:0]DataOut
    );
    
	wire [31:0]extendSa;
	assign extendSa[31:5] = 0;
	assign extendSa[4:0] = DataIn2;
	
    assign DataOut = select ? extendSa : DataIn1;
endmodule
