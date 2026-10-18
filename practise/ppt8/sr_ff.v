// 练习 4：同步 SR 触发器
// 在 CLK 上升沿更新：S=0、R=0 时保持；S=0、R=1 时清零；
// S=1、R=0 时置位；S=1、R=1 时保持原状态。
module sr_ff (
    input  wire CLK,
    input  wire S,
    input  wire R,
    output reg  Q
);
    always @(posedge CLK) begin
        if (S && !R)    Q <= 1;
        else if (!S && R)   Q <=0;
    end
endmodule
