// 练习 1：D 触发器
// 在 CLK 上升沿，将 D 保存到 Q。
module d_ff (
    input  wire CLK,
    input  wire D,
    output reg  Q
);
    always @(posedge CLK) begin
        Q <= D;

    end
endmodule
