// 练习 3：带异步低电平清零的 D 触发器
// CLRN 为 0 时立即清零；否则在 CLK 上升沿采样 D。
module d_ff_async_clear (
    input  wire CLK,
    input  wire CLRN,
    input  wire D,
    output reg  Q
);
    always @(posedge CLK or negedge CLRN) begin
        if (!CLRN)  Q <= 0;
        else Q <= D;

    end
endmodule
