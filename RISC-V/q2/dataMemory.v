module dataMemory(
    input  wire clk,          
    input  wire  [31:0] A,    
    input  wire  [31:0] WD,  
    input  wire WE, 
    output reg   [31:0] RD 
);

reg [31:0] mem [0:31]; 
integer i;
initial begin
    for (i = 0; i < 32; i = i + 1) begin
        mem[i] = i;
    end
end

always @(posedge clk) begin
    if (WE) begin
        mem[A] <= WD; // Belleğe yazma
    end
    RD <= mem[A]; // Bellekten okuma
end

endmodule
