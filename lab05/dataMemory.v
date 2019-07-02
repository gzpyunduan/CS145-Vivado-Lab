`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/17 09:28:47
// Design Name: 
// Module Name: dataMemory
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


module dataMemory(
    input clk,
    input [31:0] address,
    input [31:0] writeData,
    input memWrite,
    input memRead,
    input memToReg,
    output wire [31:0] regWriteData
    );

    reg [31:0] readData;
    reg [31:0] memFile[0:63];
    
    integer i;
    initial begin
        for (i = 0; i < 64; i = i + 1)
            memFile[i] = 0;
        readData = 0;
        $readmemh("D:/Archlabs/lab05/lab05.srcs/memory/dataFile.txt", memFile);
    end
    
    always @*
    begin
        if(memRead == 1)
            readData = memFile[address];
    end
    
    always @(negedge clk)
    begin
        if (memWrite == 1)
            memFile[address] = writeData;
    end
    
    assign regWriteData = (memToReg == 1) ? readData : address;
    
endmodule
