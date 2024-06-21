module ALU (
    input [2:0] aluControl, 
    input [31:0] SrcA,SrcB,
    output reg [31:0] ALUResult, 
    output zero
    );
always @(*)
begin
    if (aluControl == 3'b000)
        ALUResult = SrcA + SrcB;
    else if (aluControl == 3'b001)
        ALUResult = SrcA - SrcB;
    else if(aluControl == 3'b101)//slt bu bi saçma oldu
        begin
        if(SrcA < SrcB)
            ALUResult = 1;
        else 
            ALUResult = 0;
        end
        
    else if(aluControl == 3'b011)//or
        ALUResult = SrcA | SrcB;
    else if(aluControl == 3'b010)//and
        ALUResult = SrcA & SrcB;

    else
    ALUResult = {32{1'bx}};
end 
assign zero = (ALUResult == 0) ? 1 : 0;
endmodule