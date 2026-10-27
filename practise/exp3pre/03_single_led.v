// 前置练习 03：受 tick 控制的 8 位单灯循环移位
// 复位后 led=8'h01。约定 bit0 对应最右侧 LED0，因此左移时向更高位移。
// dir_ctrl=0 左移，dir_ctrl=1 右移；只有 tick=1 时移动一位。
module single_led_ring (
    input  wire       clk,
    input  wire       rst,
    input  wire       tick,
    input  wire       dir_ctrl,
    output reg  [7:0] led
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        led <= 8'h01;
    end
    else if (tick) begin
        if (dir_ctrl == 1'b0) begin
            led <= {led[6:0], led[7]};
        end
        else begin
            led <= {led[0], led[7:1]};
        end
    end
end

endmodule
