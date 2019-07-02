`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 09:42:50
// Design Name: 
// Module Name: AluCtr_tb
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


module AluCtr_tb(

    );
    
    reg [1:0] aluOp;
    reg [5:0] funct;
    
    AluCtr u1(
        .aluOp(aluOp),
        .funct(funct)
        );
        
    initial begin
        {aluOp, funct} = 8'b00000000;
    
        #80;
        
        #80 {aluOp, funct} = 8'b00000000;
        #80 {aluOp, funct} = 8'b01000000;
        #80 {aluOp, funct} = 8'b10000000;
        #80 {aluOp, funct} = 8'b10000010;
        #80 {aluOp, funct} = 8'b10000100;
        #80 {aluOp, funct} = 8'b10000101;
        #80 {aluOp, funct} = 8'b10001010;
        
    end
     
endmodule
