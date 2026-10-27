// 前置练习 04：单灯/连续双灯显示模式
// 输入 led 始终是练习 03 的单灯 one-hot 位置状态。
// mode_sel=0 显示单灯；mode_sel=1 再点亮沿移动方向的相邻灯。
// dir_ctrl=0 左移，dir_ctrl=1 右移；拼接实现环形回绕。
module led_display_mode (
    input  wire [7:0] led,
    input  wire       dir_ctrl,
    input  wire       mode_sel,
    output reg  [7:0] led_display
);

always @(*) begin
    if (mode_sel == 1'b0) begin
        led_display = led;
    end
    else if (dir_ctrl == 1'b0) begin
        led_display = led | {led[6:0], led[7]};
    end
    else begin
        led_display = led | {led[0], led[7:1]};
    end
end

endmodule
