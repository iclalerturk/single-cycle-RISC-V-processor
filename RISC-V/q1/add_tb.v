`include "add.v"
module add_tb;

reg [31:0] a,b;
wire [31:0] out;

add uut (
    .a(a),
    .b(b),
    .out(out)
);

initial begin
    $dumpfile("add.vcd");
    $dumpvars(0, add_tb);


    a = {20'b0, 5'b01010};
    b = 4;
    #10;

    

    $finish;
end

endmodule
//iverilog -o add_tb.vvp add_tb.v
//vvp add_tb.vvp
//gtkwave