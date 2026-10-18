// 练习 03：低有效输出的 2-4 译码器
// 要求：EN=1 时 Y 全为 1；EN=0 时，仅 A 对应的输出位为 0。
module decoder_2to4 (
    input        EN,
    input  [1:0] A,
    output reg [3:0] Y
);
    always @(*) begin
        // TODO: 用 if 和 case(A) 完成低有效译码
        if (EN == 1'b1) Y = 4'b1111;
        else begin
        case(A)
        2'b00 : Y = 4'b1110;
        2'b01 : Y = 4'b1101;
        2'b10 : Y = 4'b1011;
        2'b11 : Y = 4'b0111;
        default : Y = 4'b1111;
        endcase
    end
end
endmodule
