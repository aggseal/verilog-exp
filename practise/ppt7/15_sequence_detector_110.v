// 练习 15：连续 110 序列检测器
// 每个时钟上升沿采样 serial_in；检测到连续输入 110 后，detected 拉高一个时钟周期。
// 使用 Moore 型有限状态机，rst_n 为低电平异步复位。
module sequence_detector_110 (
    input  wire clk,
    input  wire rst_n,
    input  wire serial_in,
    output wire detected
);

    // S0：尚未匹配；S1：已匹配 1；S2：已匹配 11；S3：刚检测到 110
    localparam [1:0] S0 = 2'b00,
                     S1 = 2'b01,
                     S2 = 2'b10,
                     S3 = 2'b11;

    reg [1:0] state;
    reg [1:0] next_state;

    // 状态转移：输入 111 时保留后缀 11；检测完成后根据新输入保留可能的前缀。
    always @(*) begin
        case (state)
            S0: next_state = serial_in ? S1 : S0;
            S1: next_state = serial_in ? S2 : S0;
            S2: next_state = serial_in ? S2 : S3;
            S3: next_state = serial_in ? S1 : S0;
            default: next_state = S0;
        endcase
    end

    // 异步低电平复位，时钟上升沿更新状态。
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= S0;
        else
            state <= next_state;
    end

    // Moore 输出：进入检测态后输出一个时钟周期的高电平脉冲。
    assign detected = (state == S3);

endmodule
