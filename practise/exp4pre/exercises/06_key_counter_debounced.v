// 练习 6：S3 消抖计数，范围 00..99 循环。
// 连接顺序：key_s3 -> debounce -> edge_detect_2ff -> BCD 计数器。
// 仿真时可将 DEBOUNCE_CYCLES 覆盖为较小值。
module key_counter_debounced #(
    parameter integer DEBOUNCE_CYCLES = 1_000_000
) (
    input  wire       clk,
    input  wire       rst,
    input  wire       key_s3,
    output reg  [3:0] tens,
    output reg  [3:0] ones
);
    wire key_clean;
    wire key_rise;

    debounce #(.STABLE_CYCLES(DEBOUNCE_CYCLES)) u_debounce (
        .clk(clk), .rst(rst), .key_in(key_s3), .key_clean(key_clean)
    );

    edge_detect_2ff u_edge (
        .clk(clk), .rst(rst), .signal_in(key_clean), .rise_pulse(key_rise)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tens <= 4'd0;
            ones <= 4'd0;
        end else if (key_rise) begin
            if (ones == 4'd9) begin
                ones <= 4'd0;
                if (tens == 4'd9) begin
                    tens <= 4'd0;
                end else begin
                    tens <= tens + 4'd1;
                end
            end else begin
                ones <= ones + 4'd1;
            end
        end
    end
endmodule