// 示例 2：把异步输入信号同步到 clk 时钟域，并检测其上升沿。
// rise_pulse 在检测到低电平变高电平时只保持一个 clk 周期；本模块不做按键消抖。
module edge_detect_2ff (
    input  wire clk,         // 系统时钟：在每个上升沿采样输入信号。
    input  wire rst,         // 高有效异步复位：rst 拉高时立即清空同步寄存器。
    input  wire signal_in,   // 待检测的输入，例如实验中的 S3 按键。
    output wire rise_pulse   // 上升沿脉冲：可接到计数器的使能端。
);
    reg signal_r0;           // 第一级寄存器：采样 signal_in。
    reg signal_r1;           // 第二级寄存器：再延迟一级，作为前一拍状态。

    // 时钟上升沿推进两级寄存器；rst 上升沿会异步执行复位分支。
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            signal_r0 <= 1'b0;  // 复位时将第一级状态清零。
            signal_r1 <= 1'b0;  // 复位时将第二级状态清零。
        end else begin
            signal_r0 <= signal_in; // 保存当前输入状态。
            signal_r1 <= signal_r0; // 保存 signal_r0 更新前的状态（延迟一拍）。
        end
    end

    // 新状态为 1 且延迟一拍的旧状态为 0，表示检测到上升沿。
    // 按键保持为高后，signal_r0 和 signal_r1 都变为 1，脉冲随即结束。
    assign rise_pulse = signal_r0 & ~signal_r1;
endmodule