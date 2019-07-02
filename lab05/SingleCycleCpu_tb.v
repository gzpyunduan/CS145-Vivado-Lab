`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/01 15:30:29
// Design Name: 
// Module Name: SingleCycleCpu_tb
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


module SingleCycleCpu_tb();

reg Clk;
reg Reset;

wire [5:0] op;
wire [31:0] Out;
wire regDst;
wire jump;
wire branch;
wire memRead;
wire memToReg;
wire [1:0] aluOp;
wire memWrite;
wire aluSrc;
wire regWrite;

Top uut(
    .clk(Clk),
    .reset(Reset),
    .op(op),
    .aluRes(Out),
    .regDst(regDst),
    .jump(jump),
    .branch(branch),
    .memRead(memRead),
    .memToReg(memToReg),
    .aluOp(aluOp),
    .memWrite(memWrite),
    .aluSrc(aluSrc),
    .regWrite(regWrite)
);

initial begin
    Clk = 0;
    Reset = 0;

    #10;
    Clk = 1;

    #10;
    Reset = 1;

    forever #10
    begin
        Clk = !Clk;
    end
end

endmodule
