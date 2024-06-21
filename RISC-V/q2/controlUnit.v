`include "mainDecoder.v"
`include "ALUDecoder.v"
module controlUnit(
    input [6:0] opcode,
    input [2:0] funct3,
    input funct7_5,
    input zero,
    output RegWrite,
    output [1:0] ImmSrc,
    output ALUSrc,
    output MemWrite,
    output [1:0] ResultSrc,   
    output PCSrc,
    output [2:0] ALUControl
);
wire Branch;
wire Jump; 
wire temp;
wire [1:0] ALUOp;

mainDecoder mainDecoder (
    .opcode(opcode),
    .RegWrite(RegWrite),
    .ImmSrc(ImmSrc),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .Branch(Branch),
    .ALUOp(ALUOp),
    .Jump(Jump)
);

assign temp = Branch & zero;
assign PCSrc = Jump | temp;


ALUDecoder ALUDecoder (
    .ALUOp(ALUOp),
    .funct3(funct3),
    .funct7_5(funct7_5),
    .opcode_5(opcode),
    .ALUControl(ALUControl)
);



endmodule