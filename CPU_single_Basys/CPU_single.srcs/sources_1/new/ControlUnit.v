`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/20 20:22:00
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input zero,                 //ALU��zero���
    input [5:0]op,
    output reg PCWre,           //PC�Ƿ���Ը��ģ�Ϊ0������
    output reg ALUSrcA,         //ѡ��ALU��һ����������sa��Ĵ������
    output reg ALUSrcB,			//ѡ��ALU�ڶ�������������չ�����߼Ĵ������
	output reg DBDataSrc,		//ѡ��д��Ĵ����������������ݴ洢������ALU���
	output reg RegWre,			//RFдʹ���ź�
	output reg InsMemRW,		//IM�������ź�
	output reg mRD,				//DM�������ź�
	output reg mWR,				//DMд�����ź�
	output reg RegDst,			//ѡ��дRF�ĵ�ַ
	output reg ExtSel,			//����0��չ�ͷ�����չ
	output reg [1:0]PCSrc,		//ѡ������PC�ĵ�ַ
	output reg [2:0]ALUOp		//ALU����
    );
	
	initial begin
		PCWre = 1;
		ALUSrcA = 0;
		ALUSrcB = 0;
		DBDataSrc = 0;
		RegWre = 0;
		InsMemRW = 0;
		mRD = 1;
		mWR = 1;
		RegDst = 0;
		ExtSel = 0;
		PCSrc = 0;
		ALUOp = 0;
	end
	
	always @(zero or op) begin
		case (op)
			//add
			6'b000000 : begin
				PCWre = 1;
				ALUSrcA = 0;
				ALUSrcB = 0;
				DBDataSrc = 0;
				RegWre = 1;
				InsMemRW = 0;
				mRD = 1;
				mWR = 1;
				RegDst = 1;
				ExtSel = 0;
				PCSrc = 2'b00;
				ALUOp = 3'b000;
			end
			
			//addi
			6'b000001 : begin
				PCWre = 1;
				ALUSrcA = 0;
				ALUSrcB = 1;
				DBDataSrc = 0;
				RegWre = 1;
				InsMemRW = 0;
				mRD = 1;
				mWR = 1;
				RegDst = 0;
				ExtSel = 1;
				PCSrc = 2'b00;
				ALUOp = 3'b000;
			end
			
			//sub
			6'b000010 : begin
				PCWre = 1;
				ALUSrcA = 0;
				ALUSrcB = 0;
				DBDataSrc = 0;
				RegWre = 1;
				InsMemRW = 0;
				mRD = 1;
				mWR = 1;
				RegDst = 1;
				ExtSel = 0;
				PCSrc = 2'b00;
				ALUOp = 3'b001;
			end
			
			//ori
			6'b010000 : begin
				PCWre = 1;
				ALUSrcA = 0;
				ALUSrcB = 1;
				DBDataSrc = 0;
				RegWre = 1;
				InsMemRW = 0;
				mRD = 1;
				mWR = 1;
				RegDst = 0;
				ExtSel = 0;
				PCSrc = 2'b00;
				ALUOp = 3'b011;
			end
			
			//and
			6'b010001 : begin
				PCWre = 1;
				ALUSrcA = 0;
				ALUSrcB = 0;
				DBDataSrc = 0;
				RegWre = 1;
				InsMemRW = 0;
				mRD = 1;
				mWR = 1;
				RegDst = 1;
				ExtSel = 0;
				PCSrc = 2'b00;
				ALUOp = 3'b100;
			end
			
			//or
			6'b010010 : begin
				PCWre = 1;
				ALUSrcA = 0;
				ALUSrcB = 0;
				DBDataSrc = 0;
				RegWre = 1;
				InsMemRW = 0;
				mRD = 1;
				mWR = 1;
				RegDst = 1;
				ExtSel = 0;
				PCSrc = 2'b00;
				ALUOp = 3'b011;
			end
			
			//sll
			6'b011000 : begin
				PCWre = 1;
				ALUSrcA = 1;
				ALUSrcB = 0;
				DBDataSrc = 0;
				RegWre = 1;
				InsMemRW = 0;
				mRD = 1;
				mWR = 1;
				RegDst = 1;
				ExtSel = 0;
				PCSrc = 2'b00;
				ALUOp = 3'b010;
			end
			
			//slti
			6'b011011 : begin
				PCWre = 1;
				ALUSrcA = 0;
				ALUSrcB = 1;
				DBDataSrc = 0;
				RegWre = 1;
				InsMemRW = 0;
				mRD = 1;
				mWR = 1;
				RegDst = 0;
				ExtSel = 1;
				PCSrc = 2'b00;
				ALUOp = 3'b110;
			end
			
			//sw
			6'b100110 : begin
				PCWre = 1;
				ALUSrcA = 0;
				ALUSrcB = 1;
				DBDataSrc = 0;
				RegWre = 0;
				InsMemRW = 0;
				mRD = 1;
				mWR = 0;
				RegDst = 0;
				ExtSel = 1;
				PCSrc = 2'b00;
				ALUOp = 3'b000;
			end
			
			//lw
			6'b100111 : begin
				PCWre = 1;
				ALUSrcA = 0;
				ALUSrcB = 1;
				DBDataSrc = 1;
				RegWre = 1;
				InsMemRW = 0;
				mRD = 0;
				mWR = 1;
				RegDst = 0;
				ExtSel = 1;
				PCSrc = 2'b00;
				ALUOp = 3'b000;
			end
			
			//beq
			6'b110000 : begin
				PCWre = 1;
				ALUSrcA = 0;
				ALUSrcB = 0;
				DBDataSrc = 0;
				RegWre = 0;
				InsMemRW = 0;
				mRD = 1;
				mWR = 1;
				RegDst = 0;
				ExtSel = 1;
				PCSrc = (zero == 0) ? 2'b00 : 2'b01;
				ALUOp = 3'b001;
			end
			
			//bne
			6'b110001 : begin
				PCWre = 1;
				ALUSrcA = 0;
				ALUSrcB = 0;
				DBDataSrc = 0;
				RegWre = 0;
				InsMemRW = 0;
				mRD = 1;
				mWR = 1;
				RegDst = 0;
				ExtSel = 1;
				PCSrc = (zero == 0) ? 2'b01 : 2'b00;
				ALUOp = 3'b001;
			end
			
			//j
			6'b111000: begin
				PCWre = 1;
				ALUSrcA = 0;
				ALUSrcB = 0;
				DBDataSrc = 0;
				RegWre = 0;
				InsMemRW = 0;
				mRD = 1;
				mWR = 1;
				RegDst = 0;
				ExtSel = 0;
				PCSrc = 2'b10;
				ALUOp = 0;
			end
			
			//halt
			6'b111111 : begin
				PCWre = 0;
				ALUSrcA = 0;
				ALUSrcB = 0;
				DBDataSrc = 0;
				RegWre = 0;
				InsMemRW = 0;
				mRD = 1;
				mWR = 1;
				RegDst = 0;
				ExtSel = 0;
				PCSrc = 0;
				ALUOp = 0;
			end
		endcase
	end
endmodule
