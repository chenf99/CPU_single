`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/20 16:43:39
// Design Name: 
// Module Name: Multiplexer32For4
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


module Multiplexer32For4(       //����ѡ��32λ�����4ѡ1��·������
    input [1:0]PCSrc,
    input [31:0]DataIn1,
    input [31:0]DataIn2,
    input [31:0]DataIn3,        //ʵ��������ͨ·ͼ��Ϊ3ѡ1
    output reg [31:0]DataOut
    );
    
    always @(PCSrc or DataIn1 or DataIn2 or DataIn3) begin
        case (PCSrc)
            2'b00 : DataOut = DataIn1;
            2'b01 : DataOut = DataIn2;
            2'b10 : DataOut = DataIn3;
            2'b11 : DataOut = 0;        //δ��
        endcase
    end
endmodule
