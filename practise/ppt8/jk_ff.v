// 练习 5：同步 JK 触发器
// 在 CLK 上升沿更新：JK=00 保持，01 清零，10 置位，11 翻转。
module jk_ff (
    input  wire CLK,
    input  wire J,
    input  wire K,
    output reg  Q
);
    always @(posedge CLK) begin
        case ({J,K})
        2'b00 : ;
        2'b01 : Q <= 0;
        2'b10 : Q <= 1;
        2'b11 : Q <= ~Q;
        default : ;
        endcase

    end
endmodule
