module ALU (
    input [2:0] aluControl, 
    input [31:0] SrcA,SrcB,
    output zero,
    output reg [31:0] ALUResult 
    
    );
reg [31:0] mask;
always @(*)
begin
    if (aluControl == 3'b000)
        ALUResult = SrcA + SrcB;//add
    else if (aluControl == 3'b001)
        ALUResult = SrcA - SrcB;//sub
    else if(aluControl == 3'b101)//slt
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
    else if(aluControl == 3'b110)begin//sra 
        if(SrcA[31] == 0)
            mask = {32{1'b0}};  
        else
            mask = {32{1'b1}};
        ALUResult = SrcA >> SrcB; 
        ALUResult = ALUResult | mask;
        end
    else
        ALUResult = {32{1'bx}};
end 
assign zero = (ALUResult == 0) ? 1 : 0;
endmodule