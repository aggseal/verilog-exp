// 练习 4：S3 未消抖按键计数，范围 00..99 循环。
// 需与 examples/02_edge_detect_2ff.v 一起编译。
// 机械抖动可能让一次按键产生多次计数，这是本练习的观察目标。
module key_counter_raw (
    input  wire       clk,
    input  wire       rst,
    input  wire       key_s3,
    output reg  [3:0] tens,
    output reg  [3:0] ones
);
    wire key_rise;

    edge_detect_2ff u_edge (
        .clk(clk), .rst(rst), .signal_in(key_s3), .rise_pulse(key_rise)
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