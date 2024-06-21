`include "ALUDecoder.v"
module ALUDecoder_tb;

// Input signals
reg [1:0] ALUOp;
reg [2:0] funct3;
reg [6:0] funct7_5;
reg [6:0] opcode_5;

// Output signals
wire [2:0] ALUControl;

// Instantiate the ALUDecoder module
ALUDecoder uut (
    .ALUOp(ALUOp),
    .funct3(funct3),
    .funct7_5(funct7_5[5]),
    .opcode_5(opcode_5),
    .ALUControl(ALUControl)
);

// Testbench
initial begin
    $dumpfile("ALUDecoder.vcd");
    $dumpvars(0, ALUDecoder_tb);
    // Test 1: lw instructions
    ALUOp = 2'b00;

    #10;
 
    // Test 2: beq instruction
    ALUOp = 2'b01;
    #10;


    // Test 3: add instruction with opcode_5[5] = 0 and funct7_5[5] = 0
    ALUOp = 2'b10;
    funct3 = 3'b000; 
    funct7_5 = 7'b0000000; 
    opcode_5 = 7'b0000000;
    #10;
   
    
    // Test 4: sub instruction with opcode_5[5] = 1 and funct7_5[5] = 1
    ALUOp = 2'b10;
    funct3 = 3'b000;
    funct7_5 = 7'b0100000;
    opcode_5 = 7'b0110011;
    #10;

    // Test 5: slt instruction
    ALUOp = 2'b10;
    funct3 = 3'b010;
    #10;

    // Test 6: or instruction
    ALUOp = 2'b10;
    funct3 = 3'b110;

    #10;

    // Test 7: and instruction
    ALUOp = 2'b10;
    funct3 = 3'b111;

    #10;

    // Test 8: sra instruction
    ALUOp = 2'b10;
    funct3 = 3'b101;
    #10;
    $finish;
end

endmodule
//iverilog -o ALUDecoder_tb.vvp ALUDecoder_tb.v
//vvp ALUDecoder_tb.vvp
//gtkwave