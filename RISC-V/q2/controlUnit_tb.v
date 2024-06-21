`include "controlUnit.v"
module controlUnit_tb;

reg [6:0] opcode;
reg [2:0] funct3;
reg funct7_5;
reg zero;
wire RegWrite;
wire [1:0] ImmSrc;
wire ALUSrc;
wire MemWrite;
wire [1:0] ResultSrc;
wire PCSrc;
wire [2:0] ALUControl;

// Instantiate the controlUnit module
controlUnit uut (
    .opcode(opcode),
    .funct3(funct3),
    .funct7_5(funct7_5),
    .zero(zero),
    .RegWrite(RegWrite),
    .ImmSrc(ImmSrc),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .PCSrc(PCSrc),
    .ALUControl(ALUControl)
);

initial begin
    $dumpfile("controlUnit.vcd");
    $dumpvars(0, controlUnit_tb);
    
    //32'b00000000011100110000001010110011; // add
    zero = 0;
    funct3 = 3'b000; 
    funct7_5 = 7'b0; 
    opcode = 7'b0110011;
    #10;
   
    


    $finish;
end

endmodule
//iverilog -o controlUnit_tb.vvp controlUnit_tb.v
//vvp controlUnit_tb.vvp
//gtkwave