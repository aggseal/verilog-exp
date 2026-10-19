// 练习 2：带时钟使能的 D 触发器
// CLK 上升沿且 CE 为 1 时采样 D；CE 为 0 时保持原状态。
module d_ff_enable (
    input  wire CLK,
    input  wire CE,
    input  wire D,
    output reg  Q
);
    always @(posedge CLK) begin
        if (CE == 1) Q <= D;

    end
endmodule
