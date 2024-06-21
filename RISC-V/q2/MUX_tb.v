`include "MUX.v"
module MUX_tb;

reg [31 : 0] a,b;
reg select;
wire [31 : 0] out;


MUX uut (
    .a(a),
    .b(b),
    .select(select),
    .out(out)
);

initial begin
    $dumpfile("MUX.vcd");
    $dumpvars(0, MUX_tb);

    
    a = 32'h001142B3;
    b = 32'hA1B2C3D4;
    select = 1'b0;
    #10;
    select = 1'b1;
    #10;

    $finish;
end

endmodule
//iverilog -o MUX_tb.vvp MUX_tb.v
//vvp MUX_tb.vvp
//gtkwave