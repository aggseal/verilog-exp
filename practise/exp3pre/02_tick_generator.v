// 前置练习 02：按 freq_ctrl 选择分频计数终值并产生单周期 tick
// clk 为 100 MHz；freq_ctrl=00/01/10/11 分别选择 1000/100/20/10 Hz。
// 参数是计数最大值（周期时钟数减 1）；tick 只作 clk 域的使能信号。
module tick_generator #(
    parameter [25:0] cnt_1000hz = 26'd100_000 - 1,
    parameter [25:0] cnt_100hz  = 26'd1_000_000 - 1,
    parameter [25:0] cnt_20hz   = 26'd5_000_000 - 1,
    parameter [25:0] cnt_10hz   = 26'd10_000_000 - 1,
    parameter integer WIDTH     = 26
) (
    input  wire       clk,
    input  wire       rst,
    input  wire [1:0] freq_ctrl,
    output reg        tick
);

reg [WIDTH-1:0] cnt;
reg [25:0] period_max;
wire cnt_end = (cnt >= period_max);

always @(*) begin
    case (freq_ctrl)
        2'b00: period_max = cnt_1000hz;
        2'b01: period_max = cnt_100hz;
        2'b10: period_max = cnt_20hz;
        2'b11: period_max = cnt_10hz;
        default: period_max = cnt_1000hz;
    endcase
end

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

endmodule
