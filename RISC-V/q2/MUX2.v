module MUX2 (
    input [31 : 0] a,b,c,
    input  [1:0] select,
    output reg [31 : 0] out
    );
always@(*) begin
case (select)
        2'b00: assign out = a; 
        2'b01: assign out = b;
        2'b10: assign out = c;
        default: assign out = 32'b0;
    endcase
end
endmodule