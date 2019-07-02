`timescale 1ns / 1ps

module Top(
    input clk,
    input reset,
    output wire [5:0] op,
    output wire [31:0] aluRes,
    output wire regDst,
    output wire jump,
    output wire branch,
    output wire memRead,
    output wire memToReg,
    output wire [1:0] aluOp,
    output wire memWrite,
    output wire aluSrc,
    output wire regWrite
);


wire [31:0] pc;
wire [31:0] data_ex;
wire [25:0] jump_pc;

//wire [31:26] op;
wire [25:21] rs;
wire [20:16] rt;
wire [15:11] writeReg;
wire [15:0] immediate;
wire [5:0] funct;



wire [31:0] writeData;

wire [31:0] reg_to_alu1;
wire [31:0] reg_to_alu2;

wire [3:0] aluCtr;
//wire [31:0] aluRes;

wire zero;

PC wirePC(
    .clk(clk),
    .reset(reset),
    .jump(jump),
    .branch(branch),
    .zero(zero),
    .data(data_ex),
    .inst(jump_pc),
    .pc(pc)
);

InstMemory wireIM(
    .pc(pc),
    .regDst(regDst),
    .op(op),
    .rs(rs),
    .rt(rt),
    .writeReg(writeReg),
    .immediate(immediate),
    .taradd(jump_pc),
    .funct(funct)
);

Register wireReg(
    .clk(clk),
    .reset(reset),
    .readReg1(rs),
    .readReg2(rt),
    .writeReg(writeReg),
    .writeData(writeData),
    .regWrite(regWrite),
    .readData1(reg_to_alu1),
    .readData2(reg_to_alu2)
);

AluCtr wireAluCtr(
    .aluOp(aluOp),
    .funct(funct),
    .aluCtrOut(aluCtr)
);

Alu wireAlu(
    .input1(reg_to_alu1),
    .input2(reg_to_alu2),
    .aluSrc(aluSrc),
    .data(data_ex),
    .aluCtr(aluCtr),
    .zero(zero),
    .aluRes(aluRes)
);

signext wireEx(
    .immediate(immediate),
    .data(data_ex)
);

Ctr wireCtr(
    .opCode(op),
    .regDst(regDst),
    .aluSrc(aluSrc),
    .memToReg(memToReg),
    .regWrite(regWrite),
    .memRead(memRead),
    .memWrite(memWrite),
    .branch(branch),
    .aluOp(aluOp),
    .jump(jump)
);

dataMemory wireDM(
    .clk(clk),
    .address(aluRes),
    .writeData(reg_to_alu2),
    .memWrite(memWrite),
    .memRead(memRead),
    .memToReg(memToReg),
    .regWriteData(writeData)
);

endmodule