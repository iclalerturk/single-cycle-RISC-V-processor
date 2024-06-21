`include "controlUnit.v"
`include "add.v"
`include "extend.v"
`include "MUX.v"
`include "MUX2.v"
`include "ALU.v"
`include "instructionMemory.v"
`include "RegFile.v"
`include "dataMemory.v"
`include "PC1.v"	

module risc_v (
    input clk,
    input wire [31:0] PCNext,
    output [31:0] PC,
    output [31:0] instruction,
    output [31:0] result
);
wire [31:0] instructionTemp;
wire zero=0;
wire RegWrite;
wire [1:0] ImmSrc;
wire ALUSrc;
wire MemWrite;
wire [1:0] ResultSrc;
wire PCSrc;
wire [2:0] ALUControl;
wire [31:0] RD1;
wire [31:0] RD2;
wire [31:0] resultTemp;//wd3 e de result girmis
wire [31:0] ImmExt;
wire [31:0] SrcB;
wire [31:0] ALUResult;
wire [31:0] readData;
wire [31:0] PCPlus4;
wire [31:0] PCTemp;
wire [31:0] PCTarget;
wire [31:0] PCNextTemp;

PC1 pc (
    .clk(clk),
    .PC(PCTemp),
    .PCNext(PCNext)
);
add ADD (
    .a(PCTemp),
    .b(32'h00000004),
    .out(PCPlus4)    
);
instructionMemory IM (
    .A(PCTemp),
    .RD(instructionTemp)
);

controlUnit CU (
    .opcode(instructionTemp[6:0]),
    .funct3(instructionTemp[14:12]),
    .funct7_5(instructionTemp[30]),
    .zero(zero),
    .RegWrite(RegWrite),
    .ImmSrc(ImmSrc),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .PCSrc(PCSrc),
    .ALUControl(ALUControl)
);

RegFile RF (
    .clk(clk),
    .WE3(RegWrite),
    .A1(instructionTemp[19:15]),
    .A2(instructionTemp[24:20]),
    .A3(instructionTemp[11:7]),
    .WD3(resultTemp),
    .RD1(RD1),
    .RD2(RD2)
);

extend EXT (
    .a(instructionTemp[31:7]),
    .ImmSrc(ImmSrc),
    .out(ImmExt)
);
assign PCNextTemp=PCNext;
add add2(
    .a(PCTemp),
    .b(ImmExt),
    .out(PCTarget)
);
MUX mm(
    .a(PCPlus4),
    .b(PCTarget),
    .select(PCSrc),
    .out(PCNextTemp)
);

MUX M (
    .a(RD2),
    .b(ImmExt),
    .select(ALUSrc),
    .out(SrcB)
);

ALU alu (
    .SrcA(RD1),
    .SrcB(SrcB),
    .aluControl(ALUControl),
    .ALUResult(ALUResult),
    .zero(zero)
);

dataMemory DM (
    .clk(clk),
    .A(ALUResult),
    .WE(MemWrite),
    .WD(RD2),
    .RD(readData)
);

MUX2 M2 (
    .a(ALUResult),
    .b(readData),
    .c(PCPlus4),
    .select(ResultSrc),
    .out(resultTemp)
); 

assign result = resultTemp;
assign instruction = instructionTemp;
assign PC = PCTemp;
//assign PCNext = PCNextTemp;

endmodule


