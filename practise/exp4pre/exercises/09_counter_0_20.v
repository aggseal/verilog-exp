// 练习 9：0..20 的两位 BCD 计数器。
// 仅 tick_100ms && run 时更新；20 后回到 00。
module counter_0_20 (
    input  wire       clk,
    input  wire       rst,
    input  wire       tick_100ms,
    input  wire       run,
    output reg  [3:0] tens,
    output reg  [3:0] ones
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tens <= 4'd0;
            ones <= 4'd0;
        end else if (tick_100ms && run) begin
            if ((tens == 4'd2) && (ones == 4'd0)) begin
                tens <= 4'd0;
                ones <= 4'd0;
            end else if (ones == 4'd9) begin
                ones <= 4'd0;
                tens <= tens + 4'd1;
            end else begin
                ones <= ones + 4'd1;
            end
        end
    end
endmodule