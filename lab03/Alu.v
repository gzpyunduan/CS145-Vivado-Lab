`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 10:27:54
// Design Name: 
// Module Name: Alu
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


module Alu(input1, input2, aluCtr, zero, aluRes);
    input [31:0] input1;
    input [31:0] input2;
    input [3:0] aluCtr;
    output reg zero;
    output reg aluRes;
    
    always @ (input1 or input2 or aluCtr)
    begin
        zero = 0;
        if (aluCtr == 4'b0010)
            aluRes = input1 + input2;
        else if (aluCtr == 4'b0110)
        begin
            aluRes = input1 - input2;
            if (aluRes == 0)
                zero = 1;
            else 
                zero = 0;
        end
        else if (aluCtr == 4'b0000)
        begin
            aluRes = input1 & input2;
            if (aluRes == 0)
                zero = 1;
        end
        else if (aluCtr == 4'b0001)
            aluRes = input1 | input2;
        else if (aluCtr == 4'b0111)
        begin
            if (input1 < input2)
                aluRes = 1;
            else
            begin
                aluRes = 0;
                zero = 1;
            end
        end
        else if (aluCtr == 4'b1100)
            aluRes = ~(input1 | input2);
        else 
            zero = 1;
    end
    
endmodule
