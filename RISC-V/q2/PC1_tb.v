`include "PC1.v"
module PC1_tb;

reg clk;
reg [31:0] PCNext;
wire [31:0] PC;

PC1 uut (
    
    .clk(clk),
    .PCNext(PCNext),
    .PC(PC)
   
);
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    $dumpfile("PC1.vcd");
    $dumpvars(0, PC1_tb);

    
    PCNext = 32'h00000000;
    #10;
    PCNext = 32'h00000004;
    #10;

    $finish;
end

endmodule
//iverilog -o PC1_tb.vvp PC1_tb.v
//vvp PC1_tb.vvp
//gtkwave