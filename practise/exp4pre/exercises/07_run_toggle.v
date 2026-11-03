// 练习 7：消抖后的 S2 上升沿切换 run 状态。
// run 复位为 1，即复位后计数自动运行。
module run_toggle (
    input  wire clk,
    input  wire rst,
    input  wire toggle_pulse,
    output reg  run
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            run <= 1'b1;
        end else if (toggle_pulse) begin
            run <= ~run;
        end
    end
endmodule