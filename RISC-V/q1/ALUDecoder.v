module ALUDecoder (
    input [1:0] ALUOp,
    input [2:0] funct3,
    input funct7_5,
    input [6:0] opcode_5,
    output reg [2:0] ALUControl
);



always @(*) begin
    case (ALUOp)
        2'b00 : ALUControl <= 3'b000;
        2'b01 : ALUControl <= 3'b001;
        2'b10 : case({funct3})
        3'b000 : case({opcode_5[5],funct7_5})
        2'b00 : ALUControl <= 3'b000; // add
        2'b01 : ALUControl <= 3'b000; // add
        2'b10 : ALUControl <= 3'b000; // add
        2'b11 : ALUControl <= 3'b001; // sub
        default : ALUControl <= 3'bxxx;

        endcase
        
        3'b010 : ALUControl <= 3'b101; // slt
        3'b110 : ALUControl <= 3'b011; // or
        3'b111 : ALUControl <= 3'b010; // and
        
        endcase
    endcase
end

endmodule
