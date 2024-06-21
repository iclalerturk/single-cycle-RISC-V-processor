`include "MUX2.v"
module MUX2_tb;

reg [31 : 0] a,b,c;
reg  [1:0] select;
wire [31 : 0] out;

MUX2 uut (
    .a(a),
    .b(b),
    .c(c),
    .select(select),
    .out(out)
);

initial begin
    $dumpfile("MUX2.vcd");
    $dumpvars(0, MUX2_tb);

    
    a = 32'h001142B3;
    b = 32'hA1B2C3D4;
    c = 32'hC15C1C1C;
    select = 2'b00;
    #10;
    select = 2'b01;
    
    #10;
    select = 2'b10;
    
    #10;
    select = 2'b11;
    #10;

    $finish;
end

endmodule
//iverilog -o MUX2_tb.vvp MUX2_tb.v
//vvp MUX2_tb.vvp
//gtkwave