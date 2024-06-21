`include "mainDecoder.v"
module mainDecoder_tb;

// Input signals
reg [6:0] opcode;

// Output signals
wire RegWrite;
wire [1:0] ImmSrc;
wire ALUSrc;
wire MemWrite;
wire [1:0] ResultSrc;
wire Branch;
wire [1:0] ALUOp;
wire Jump;

// Instantiate the mainDecoder module
mainDecoder uut (
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

// Clock generation
reg clk = 0;
always #5 clk = ~clk;

// Testbench
initial begin
    $dumpfile("mainDecoder.vcd");
    $dumpvars(0, mainDecoder_tb);
    // lw instruction test
    opcode = 7'b0000011;
    #10;   
    // sw instruction test
    opcode = 7'b0100011;
    #10; 
    // R-type instruction test
    opcode = 7'b0110011;
    #10;
    // beq instruction test
    opcode = 7'b1100011;
    #10;
    // I-type ALU instruction test
    opcode = 7'b0010011;
    #10;
    // jal instruction test
    opcode = 7'b1101111;
    #10;
    $finish;
end

endmodule
//iverilog -o mainDecoder_tb.vvp mainDecoder_tb.v
//vvp mainDecoder_tb.vvp