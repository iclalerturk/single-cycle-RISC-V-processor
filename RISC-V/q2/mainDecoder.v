module mainDecoder (
    input [6:0] opcode, 
    output reg RegWrite,
    output reg [1:0] ImmSrc,
    output reg ALUSrc, 
    output reg MemWrite,
    output reg [1:0] ResultSrc,
    output reg Branch,
    output reg [1:0] ALUOp,
    output reg Jump 
);

always @(*) begin
    case(opcode)
        7'b0000011: // lw instruction
            begin
                RegWrite = 1;
                ImmSrc = 2'b00;
                ALUSrc = 1; 
                MemWrite = 0; 
                ResultSrc = 2'b01;
                Branch = 0;
                ALUOp = 2'b00;
                Jump = 0;
            end
        7'b0100011: // sw instruction
            begin
                RegWrite = 0;
                ImmSrc = 2'b01;
                ALUSrc = 1;
                MemWrite = 1;
                ResultSrc = 2'bxx;
                Branch = 0;
                ALUOp = 3'b00;
                Jump = 0;
            end
        7'b0110011: // R-type instruction
            begin
                RegWrite = 1;
                ImmSrc = 2'bxx;
                ALUSrc = 0;
                MemWrite = 0;
                ResultSrc = 2'b00;
                Branch = 0;
                ALUOp = 2'b10;
                Jump = 0;
            end
        7'b1100011: // beq instruction
            begin
                RegWrite = 0;
                ImmSrc = 2'b10;
                ALUSrc = 0;
                MemWrite = 0;
                ResultSrc = 2'bxx;
                Branch = 1; 
                ALUOp = 2'b01; 
                Jump = 0; 
            end
        7'b0010011: // I-type ALU instruction
            begin
                RegWrite = 1; 
                ImmSrc = 2'b00; 
                ALUSrc = 1; 
                MemWrite = 0; 
                ResultSrc = 2'b00; 
                Branch = 0; 
                ALUOp = 2'b10; 
                Jump = 0; 
            end
        7'b1101111: // jal instruction
            begin
                RegWrite = 1; 
                ImmSrc = 2'b11;
                ALUSrc = 1'bx; 
                MemWrite = 0;
                ResultSrc = 2'b10;
                Branch = 0; 
                ALUOp = 3'bxx; 
                Jump = 1;
            end
        default: // Varsayılan durum
            begin
                // Default olarak tüm kontrol sinyallerini sıfırla
                RegWrite = 0;
                ImmSrc = 2'b00;
                ALUSrc = 0;
                MemWrite = 0;
                ResultSrc = 2'b00;
                Branch = 0;
                ALUOp = 3'b000;
                Jump = 0;
            end
    endcase
end

endmodule
