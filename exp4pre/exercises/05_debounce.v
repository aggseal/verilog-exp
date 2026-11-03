// 练习 5：计数器法按键消抖。
// 默认 100 MHz 时钟下连续稳定 1_000_000 周期（10 ms）后更新输出。
module debounce #(
    parameter integer STABLE_CYCLES = 1_000_000
) (
    input  wire clk,
    input  wire rst,
    input  wire key_in,
    output reg  key_clean
);
    localparam integer CW = (STABLE_CYCLES <= 1) ? 1 : $clog2(STABLE_CYCLES);
    reg key_meta;
    reg key_sync;
    reg [CW-1:0] stable_count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            key_meta     <= 1'b0;
            key_sync     <= 1'b0;
            key_clean    <= 1'b0;
            stable_count <= {CW{1'b0}};
        end else begin
            // 两级同步：先采样输入，再延迟一拍送入 key_sync。
            key_meta <= key_in;
            key_sync <= key_meta;

            if (key_sync == key_clean) begin
                stable_count <= {CW{1'b0}};
            end else if (stable_count == STABLE_CYCLES - 1) begin
                key_clean    <= key_sync;
                stable_count <= {CW{1'b0}};
            end else begin
                stable_count <= stable_count + 1'b1;
            end
        end
    end
endmodule