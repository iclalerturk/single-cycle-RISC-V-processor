`include "dataMemory.v"
module dataMemory_tb;

reg clk;          
reg [31:0] A;    
reg [31:0] WD;  
reg WE; 
wire [31:0] RD;

dataMemory uut (
    .clk(clk),
    .A(A),
    .WD(WD),
    .WE(WE),
    .RD(RD)
);

initial begin
    $dumpfile("dataMemory.vcd");
    $dumpvars(0, dataMemory_tb);

    clk = 0;
    A = 32'h00000004;
    WD = 32'h00000002;
    WE = 1;
    
    clk = 1;

    #10;

    

    $finish;
end

endmodule
//iverilog -o dataMemory_tb.vvp dataMemory_tb.v
//vvp dataMemory_tb.vvp
//gtkwave