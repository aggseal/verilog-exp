// 练习 04：七段显示译码器
// 要求：共阴极段码，SEGS 位序为 abcdefg；EN=0 时关闭所有段。
// 基础：完成 0-9；拓展：补齐 A-F。
module seven_segment (
    input      [3:0] DIG,
    input            EN,
    output reg [6:0] SEGS
);
    always @(*) begin
        // TODO: 根据 EN 和 DIG 写出七段译码逻辑
        if (EN == 1'b0) SEGS = 7'b0000000;
        else begin
            case (DIG)
            4'h0 : SEGS = 7'b1111110;
            4'h1 : SEGS = 7'b0110000;
            4'h2 : SEGS = 7'b1101101;
            4'h3 : SEGS = 7'b1111001;
            4'h4 : SEGS = 7'b0110011;
            4'h5 : SEGS = 7'b1011011;
            4'h6 : SEGS = 7'b1011111;
            4'h7 : SEGS = 7'b1110000;
            4'h8 : SEGS = 7'b1111111;
            4'h9 : SEGS = 7'b1111011;
            default : SEGS = 7'b0000000;
            endcase
        end 
    end

endmodule
