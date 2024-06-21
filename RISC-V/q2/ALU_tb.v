`include "ALU.v"
module ALU_tb;

reg [2:0] aluControl;
reg [31:0] SrcA, SrcB;
wire zero;
wire [31:0] ALUResult;

ALU uut (
    .SrcA(SrcA),
    .SrcB(SrcB),
    .aluControl(aluControl),
    .ALUResult(ALUResult),
    .zero(zero)
);

initial begin
    $dumpfile("ALU.vcd");
    $dumpvars(0, ALU_tb);


    SrcA = 32'h00000004;
    SrcB = 32'h00000002;
    aluControl = 3'b000;
    #10;

    

    $finish;
end

endmodule
//iverilog -o ALU_tb.vvp ALU_tb.v
//vvp ALU_tb.vvp
//gtkwave