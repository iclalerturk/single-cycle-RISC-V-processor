module MUX (
    input [31:0] a,b,
    input  select,
    output [31:0] out
    );

assign out = (select == 1'b0) ? a : b;
endmodule
