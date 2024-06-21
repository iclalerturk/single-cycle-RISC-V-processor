`include "extend.v"
module extend_tb;

reg [24:0] a;
reg [1:0] ImmSrc;
wire [31:0] out;

extend uut (
    .a(a),
    .ImmSrc(ImmSrc),
    .out(out)
);

initial begin
    $dumpfile("extend.vcd");
    $dumpvars(0, extend_tb);

    ImmSrc = 2'b00;
    a = {20'b0, 5'b01010};
    $display("%b",a);
    #10;
    ImmSrc = 2'b01;
    a = {20'b11111111111111111111, 5'b01010};
    $display("%b",a);
    #10;
    ImmSrc = 2'b10;
    a = {20'b0, 5'b01010};
    $display("%b",a);
    #10;
    ImmSrc = 2'b11;
    a = {20'b11111111111111111111, 5'b01010};
    $display("%b",a);
    #10;

    $finish;
end

endmodule
//iverilog -o extend_tb.vvp extend_tb.v
//vvp extend_tb.vvp
//gtkwave