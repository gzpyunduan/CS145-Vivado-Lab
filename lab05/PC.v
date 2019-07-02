`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/01 10:17:23
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
    input clk,
    input reset,
    input jump,
    input branch,
    input zero,
    input [31:0] data,
    input [25:0] inst,
    output reg [31:0] pc
    );

    wire [31:0] Pc;
    assign Pc = pc + 1;

    always @(posedge clk or negedge reset)
    begin
        if (reset == 0)
            pc = 0;
        else if (jump == 1)
            pc = {Pc[31:26], inst};
        else if (branch & zero == 1)
            pc = Pc + data;
        else
            pc = Pc;
    end

endmodule
