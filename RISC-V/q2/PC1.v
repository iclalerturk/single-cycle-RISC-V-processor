module PC1(
    input clk,
    input [31:0] PCNext,
    output reg [31:0] PC
);

always@(posedge clk)
begin 
PC <= PCNext;
end
endmodule