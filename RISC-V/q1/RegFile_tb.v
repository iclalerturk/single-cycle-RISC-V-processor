`include "RegFile.v"
module RegFile_tb;

reg clk, WE3;
reg [4:0] A1, A2, A3;
reg [31:0] WD3;
wire [31:0] RD1, RD2;


RegFile uut (
    .clk(clk),
    .WE3(WE3),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .WD3(WD3),
    .RD1(RD1),
    .RD2(RD2)
);

initial begin
    $dumpfile("RegFile.vcd");
    $dumpvars(0, RegFile_tb);
    
    clk = 1;
    WE3 = 1;
    A1 = 5'b00000;
    A2 = 5'b00001;
    A3 = 5'b00010;
    WD3 = 32'b00000000000000000000000000000011;
    #10;


    $finish;
end

endmodule
//iverilog -o RegFile_tb.vvp RegFile_tb.v
//vvp RegFile_tb.vvp
//gtkwave