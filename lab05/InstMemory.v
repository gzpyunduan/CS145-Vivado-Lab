`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/17 11:23:59
// Design Name: 
// Module Name: InstMemory
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


module InstMemory(
        input [31:0] pc,
        input regDst,
        output wire [31:26] op,
        output wire [25:21] rs,
        output wire [20:16] rt,
        output wire [15:11] writeReg,
        output wire [15:0] immediate,
        output wire [25:0] taradd,
        output wire [5:0] funct
    );

    reg [31:0] instFile[0:63];
    reg [31:0] instruction;

    integer i;
    initial begin
        for (i = 0; i < 64; i = i + 1)
            instFile[i] = 0;
        $readmemb("D:/Archlabs/lab05/lab05.srcs/memory/instFile.txt", instFile);
        instruction = 0;
    end

    always @(pc)
        instruction = instFile[pc];

    assign op = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign writeReg = (regDst == 1) ? instruction[15:11] : rt;
    assign immediate = instruction[15:0];
    assign taradd = instruction[25:0];
    assign funct = instruction[5:0];

endmodule
