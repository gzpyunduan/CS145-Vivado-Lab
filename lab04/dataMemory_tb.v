`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/17 10:26:30
// Design Name: 
// Module Name: dataMemory_tb
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


module dataMemory_tb(

    );
    reg memWrite;
    reg memRead;
    reg [31:0] address;
    reg [31:0] writeData;
    
    dataMemory u1(
        .memWrite(memWrite),
        .memRead(memRead),
        .address(address),
        .writeData(writeData)
    );
    
    initial begin
        memWrite = 0;
        memRead = 0;
        address = 0;
        writeData = 0;
        
        #185;
        memWrite = 1'b1;
        address = 32'b00000000000000000000000000000111;
        writeData = 32'b11100000000000000000000000000000;
        
        #100;
        memWrite = 1'b1;
        writeData = 32'hffffffff;
        address = 32'b00000000000000000000000000000110;
        
        #185;
        address = 7;
        memRead = 1'b1;
        memWrite = 1'b0;
        
        #80;
        memWrite = 1;
        address = 8;
        writeData = 32'haaaaaaaa;
        
        #80;
        address = 6;
        memWrite = 0;
        memRead = 1;
        
    end
    
    
endmodule
