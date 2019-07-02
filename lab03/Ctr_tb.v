`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 08:48:16
// Design Name: 
// Module Name: Ctr_tb
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


module Ctr_tb(

    );
    
    reg [5:0] OpCode;
    
    Ctr u0(
        .opCode(OpCode));
    
    initial begin
        OpCode = 0;
        
        #100;
        
        #100 OpCode = 6'b000000;
        #100 OpCode = 6'b100011;
        #100 OpCode = 6'b101011;
        #100 OpCode = 6'b000100;
        #100 OpCode = 6'b000010;
        
    end
    
endmodule
