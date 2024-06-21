module extend(
    input [24:0] a,
    input [1:0] ImmSrc,
    output reg [31:0] out
    );

always@(*) begin
    case(ImmSrc)
        2'b00:  begin
                    out = {{20{a[24]}}, a[24:13]};
                end
        2'b01: begin
                    out = {{20{a[24]}},a[24:18],a[4:0]};
                end
        2'b10: begin
                    out[31:12] = {{20{a[24]}},a[0],a[23:18],a[4:1],1'b0};
                    
                end
        2'b11: begin
                    out[31:20] = {{12{a[24]}}, a[12:5], a[13], a[23:14], 1'b0};
                    
                end
    endcase

    end

endmodule