`include "instructionMemory.v"
module instructionMemory_tb;

reg [31:0] A;
wire [31:0] RD;


instructionMemory uut (
    .A(A),
    .RD(RD)
);

initial begin
    $dumpfile("instructionMemory.vcd");
    $dumpvars(0, instructionMemory_tb);
    
   
   
    A = 32'h00000010;
    #10;


    $finish;
end

endmodule
//iverilog -o instructionMemory_tb.vvp instructionMemory_tb.v
//vvp instructionMemory_tb.vvp
//gtkwave