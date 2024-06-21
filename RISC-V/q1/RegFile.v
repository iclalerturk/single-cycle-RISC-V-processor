module RegFile (
    input clk, WE3,
    input [4:0] A1, A2, A3,
    input [31:0] WD3,
    output reg [31:0] RD1, RD2
);
    reg [31:0] registers [31:0]; //32 tane 32-bit register
    integer i;

    always @(*) begin
        for (i = 0; i < 32; i = i + 1) begin
            registers[i] <= i;
        end
            
        RD1 <= registers[A1];
        RD2 <= registers[A2];
        
    end

    always @(posedge clk) begin
        if (WE3) begin
            //Yazma
            registers[A3] <= WD3;
        end
    end
endmodule
