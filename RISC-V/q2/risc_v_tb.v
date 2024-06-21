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
    //clk = 0;
    PCNext = 32'h00000034;//sra
   // clk = 1;
    #10;
    $monitor("PC = %h", PC); 
    #10;
    $monitor("result = %h", result); 
    #10;

    

    $finish;
end

endmodule

//iverilog -o risc_v_tb.vvp risc_v_tb.v
//vvp risc_v_tb.vvp
//gtkwave