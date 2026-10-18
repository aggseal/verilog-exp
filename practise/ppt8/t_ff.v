// 练习 6：同步 T 触发器
// 在 CLK 上升沿，T=0 时保持；T=1 时翻转。
module t_ff (
    input  wire CLK,
    input  wire T,
    output reg  Q
);
    always @(posedge CLK) begin

    end
endmodule
