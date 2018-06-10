`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/21 17:52:39
// Design Name: 
// Module Name: CPU_single_sim
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


module CPU_single_sim();
    reg CLK;
    reg Reset;
    
    wire [31:0]PCAddress, PC4Address;
	wire [31:0]ReadData1;
	wire [31:0]ReadData2;
	wire [31:0]DB;
	wire [31:0]instruction;
	wire [31:0]ALUresult;
	wire [31:0]DataOut;
	wire [5:0]opcode;
	wire [4:0]rs, rt, rd;
	
	CPU_single test(
		.CLK(CLK),
		.Reset(Reset),
		.PCAddress(PCAddress),
		.PC4Address(PC4Address),
		.rs(rs),
        .rt(rt),
		.ReadData1(ReadData1),
		.ReadData2(ReadData2),
		.ALUresult(ALUresult),
		.DB(DB)
	);
	
	initial begin
	   CLK = 0;
       Reset = 0;
       #20;
       CLK = 1;
       
       #20;
        Reset = 1;
        
       forever #20
        CLK = !CLK;
	end
endmodule
