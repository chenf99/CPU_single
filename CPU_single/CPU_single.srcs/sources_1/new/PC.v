`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/20 11:18:50
// Design Name: 
// Module Name: PC
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


module PC(
    input CLK,          //时钟
    input Reset,        //为0时重置
    input PCWre,        //为0时停机，PC不更改
    input [31:0]inputAddress,
    output reg [31:0]outputAddress
    );
    
    initial begin
        outputAddress <= 0;//初始化PC地址为0
    end
    
    always@(posedge CLK or negedge Reset) begin
        if (Reset == 0) outputAddress <= 0;
        else begin
            if (PCWre == 1) outputAddress <= inputAddress;
        end
    end
endmodule
