`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 06:25:33
// Design Name: 
// Module Name: Register
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


module Register(
    input clk,
    input reset,
    input [25:21] readReg1,
    input [20:16] readReg2,
    input [4:0] writeReg,
    input [31:0] writeData,
    input regWrite,
    output reg [31:0] readData1,
    output reg [31:0] readData2
    );
    
    initial
    begin   
        for (i = 0; i < 32; i = i + 1)
            regFile[i] = 0;
    end
    
    integer i;
    reg [31:0] regFile[31:0];
    
    always @(readReg1 or readReg2)
    begin
        readData1 = regFile[readReg1];
        readData2 = regFile[readReg2];
    end
    
    always @(negedge clk or negedge reset)
    begin
        if(reset == 0)
        begin
            for (i = 0; i < 32; i = i + 1)
            regFile[i] = 0;
        end
        else if(regWrite == 1)
            regFile[writeReg] = writeData;
    end
        
endmodule
