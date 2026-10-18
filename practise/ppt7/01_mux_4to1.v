// 练习 01：4 选 1 多路复用器
// 要求：EN_L 为低有效使能；禁用时 Y 输出 0；用 case(S) 选择 A/B/C/D。
module mux_4to1 (
    input        EN_L,
    input  [1:0] S,
    input  [7:0] A, B, C, D,
    output reg [7:0] Y
);
    always @(*) begin
        // TODO: 写选择逻辑（if + case）
        if (EN_L == 1'b1) Y = 8'b0;
        else begin
        
        case(S)
          2'b00 : Y = A;
          2'b01 : Y = B;
          2'b10 : Y = C;
          2'b11 : Y = D;
          default : Y = 8'b0;
        endcase
    end
end
endmodule
