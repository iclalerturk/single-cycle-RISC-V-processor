`include "risc_v.v"
module risc_v_tb;

// Inputs
reg clk;
reg [31:0] PCNext;
wire [31:0] PC;
wire [31:0] instruction;
wire [31:0] result;
// Instantiate the unit under test (UUT)
risc_v uut (
    .clk(clk),
    .PC(PC),
    .PCNext(PCNext),
    .instruction(instruction),
    .result(result)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end 

// Test case
initial begin
    $dumpfile("risc_v.vcd");
    $dumpvars(0, risc_v_tb);
    PCNext = 32'h00000000;//add
    #10;
    PCNext = 32'h00000004;//sub
    #10;
    PCNext = 32'h00000008;//lw
    #10;
    PCNext = 32'h0000000C;//jal
    #10;
    PCNext = 32'h00000010;//slti
    #10;
    PCNext = 32'h00000014;//beq
    #10;
    PCNext = 32'h00000018;//sw
    #10;
    PCNext = 32'h0000001C;//ori
    #10;
    PCNext = 32'h00000020;//andi
    #10;
    PCNext = 32'h00000024;//or
    #10;
    PCNext = 32'h00000028;//addi
    #10;
    PCNext = 32'h0000002C;//slt
    #10;
    PCNext = 32'h00000030;//and
    #10;

    $finish;
end

endmodule

//iverilog -o risc_v_tb.vvp risc_v_tb.v
//vvp risc_v_tb.vvp
//gtkwave