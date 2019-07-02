`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 10:51:06
// Design Name: 
// Module Name: Alu_tb
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


module Alu_tb(

    );
    reg [31:0] input1;
    reg [31:0] input2;
    reg [3:0] aluCtr;
    
    Alu u2(
        .input1(input1),
        .input2(input2),
        .aluCtr(aluCtr)
        );
        
    initial begin
        input1 = 0;
        input2 = 0;
        aluCtr = 4'b0000;//100
        
        #100
        begin
            input1 = 4'd15;
            input2 = 4'd10;
        end//200
        #100
            aluCtr = 4'b0001;//300
        #100
            aluCtr = 4'b0010;//400
        #100
            aluCtr = 4'b0110;//500
        #100
        begin
            input1 = 4'd10;
            input2 = 4'd15;
        end//600
        #100
        begin
            input1 = 4'd15;
            input2 = 4'd10;
            aluCtr = 4'b0111;
        end//700
        #100
        begin
            input1 = 4'd10;
            input2 = 4'd15;
        end//800
        #100
        begin
            input1 = 4'd1;
            input2 = 4'd1;
            aluCtr = 4'b1100;
        end//900
        #100
            input1 = 5'd16;//1000
          
    end
            
    
    
endmodule
