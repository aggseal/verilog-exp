// 练习 8：产生 0.1 秒节拍；100 MHz 下默认 10_000_000 个周期。
// run=0 时冻结计数，run=1 时继续计时。
module tick_100ms #(
    parameter integer PERIOD_CYCLES = 10_000_000
) (
    input  wire clk,
    input  wire rst,
    input  wire run,
    output reg  tick
);
    localparam integer CW = (PERIOD_CYCLES <= 1) ? 1 : $clog2(PERIOD_CYCLES);
    reg [CW-1:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= {CW{1'b0}};
            tick  <= 1'b0;
        end else begin
            tick <= 1'b0;
            if (run) begin
                if (count == PERIOD_CYCLES - 1) begin
                    count <= {CW{1'b0}};
                    tick  <= 1'b1;
                end else begin
                    count <= count + 1'b1;
                end
            end
        end
    end
endmodule