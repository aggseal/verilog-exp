// 前置练习 05：单模块流水灯顶层
// freq_ctrl=00/01/10/11 分别选择 1000/100/20/10 Hz。
// dir_ctrl=0 左移、dir_ctrl=1 右移；mode_sel=0 单灯、mode_sel=1 连续双灯。
// 仿真时可覆盖四个计数终值参数缩短周期；WIDTH 默认 26。
module flowing_water_top #(
    parameter [25:0] cnt_1000hz = 26'd100_000 - 1,
    parameter [25:0] cnt_100hz  = 26'd1_000_000 - 1,
    parameter [25:0] cnt_20hz   = 26'd5_000_000 - 1,
    parameter [25:0] cnt_10hz   = 26'd10_000_000 - 1,
    parameter integer WIDTH     = 26
) (
    input  wire       clk,
    input  wire       rst,
    input  wire [1:0] freq_ctrl,
    input  wire       dir_ctrl,
    input  wire       mode_sel,
    output reg  [7:0] led
);

reg [WIDTH-1:0] cnt;
reg [25:0] period_max;
reg tick;
reg [7:0] led_position;
wire cnt_end = (cnt >= period_max);

// 根据频率选择拨码选择计数最大值。
always @(*) begin
    case (freq_ctrl)
        2'b00: period_max = cnt_1000hz;
        2'b01: period_max = cnt_100hz;
        2'b10: period_max = cnt_20hz;
        2'b11: period_max = cnt_10hz;
        default: period_max = cnt_1000hz;
    endcase
end

// 100 MHz 主时钟计数；tick 仅为一个 clk 周期的使能脉冲。
always @(posedge clk or posedge rst) begin
    if (rst) begin
        cnt  <= {WIDTH{1'b0}};
        tick <= 1'b0;
    end
    else begin
        tick <= 1'b0;
        if (cnt_end) begin
            cnt  <= {WIDTH{1'b0}};
            tick <= 1'b1;
        end
        else begin
            cnt <= cnt + 1'b1;
        end
    end
end

// 保存单灯位置；复位后点亮 LED0，只有 tick 有效时才循环移位。
always @(posedge clk or posedge rst) begin
    if (rst) begin
        led_position <= 8'h01;
    end
    else if (tick) begin
        if (dir_ctrl == 1'b0)
            led_position <= {led_position[6:0], led_position[7]};
        else
            led_position <= {led_position[0], led_position[7:1]};
    end
end

// 单灯模式直接显示位置；双灯模式再点亮移动方向上的相邻灯。
always @(*) begin
    if (mode_sel == 1'b0) begin
        led = led_position;
    end
    else if (dir_ctrl == 1'b0) begin
        led = led_position | {led_position[6:0], led_position[7]};
    end
    else begin
        led = led_position | {led_position[0], led_position[7:1]};
    end
end

endmodule
