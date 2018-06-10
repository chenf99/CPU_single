`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/21 16:27:41
// Design Name: 
// Module Name: CPU_single
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


module CPU_single(
    input CLK,
    input Reset,
	output [31:0]PCAddress,
	output [31:0]PC4Address,
	output [4:0]rs,
    output [4:0]rt,
	output [31:0]ReadData1,
	output [31:0]ReadData2,
	output [31:0]ALUresult,
	output [31:0]DB
	/*
	output [31:0]instruction,
	output [31:0]DataOut,
	output [5:0]opcode,
	output [4:0]rd*/
    );
	wire [31:0]instruction,DataOut;
	wire [5:0]opcode;
	wire [4:0]rd;
	
	wire [2:0]ALUOp;
	wire [1:0]PCSrc;
	wire [31:0]address_immediate, jAddress, newAddress;
	wire [31:0]extendImmediate;
	wire [4:0]WriteReg;
	wire [31:0]A, B;
	wire zero, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel;
	
	ControlUnit cu(zero, instruction[31:26], PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel, PCSrc, ALUOp);
	
	PC pc(CLK, Reset, PCWre, newAddress, PCAddress);
	
	InstrucionMemory im(InsMemRW, PCAddress, instruction);
	
	RegFile rf(CLK, RegWre, instruction[25:21], instruction[20:16], WriteReg, DB, ReadData1, ReadData2);
	
	ALU alu(ALUOp, A, B, ALUresult, zero);
	
	SignZeroExtend sze(ExtSel, instruction[15:0], extendImmediate);
	
	DataMemory dm(CLK, ALUresult, ReadData2, mRD, mWR, DataOut);
	
	Multiplexer5 m5(RegDst, instruction[20:16], instruction[15:11], WriteReg);
	
	Multiplexer32ForA m32_A(ALUSrcA, ReadData1, instruction[10:6], A);
	Multiplexer32ForB m32_B(ALUSrcB, ReadData2, extendImmediate, B);
	Multiplexer32ForB m32_DB(DBDataSrc, ALUresult, DataOut, DB);				
	
	assign opcode = instruction[31:26];
	assign rs = instruction[25:21];
	assign rt = instruction[20:16];
	assign rd = instruction[15:11];
	
	wire [25:0]addr;
	assign PC4Address = PCAddress + 4;
	assign address_immediate = PC4Address + (extendImmediate << 2);
	assign jAddress[31:28] = PC4Address[31:28];
	assign jAddress[27:2] = instruction[25:0];
	assign addr = jAddress[27:2];
	assign jAddress[2:0] = 2'b00;
	Multiplexer32For4 m32_4(PCSrc, PC4Address, address_immediate, jAddress, newAddress);
endmodule
