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


module Multiplexer5(    //����ѡ��5λ����Ķ�ѡһ��·������
    input RegDst,       //2ѡ1ѡ���ź�
    input [4:0]DataIn1,
    input [4:0]DataIn2,
    output [4:0]DataOut
    );
    
    assign DataOut = RegDst ? DataIn2 : DataIn1;
endmodule
