// 练习 1：扫描节拍发生器。
// 默认 100 MHz 时钟下 DIV=100_000 对应每 1 ms 产生一个单周期脉冲。
// 仿真时可将 DIV 覆盖为较小值。
module tick_gen #(
    parameter integer DIV = 100_000
) (
    input  wire clk,
    input  wire rst,
    output reg  tick
);
    localparam integer CW = (DIV <= 1) ? 1 : $clog2(DIV);
    reg [CW-1:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= {CW{1'b0}};
            tick  <= 1'b0;
        end else begin
            tick <= 1'b0;
            if (count == DIV - 1) begin
                count <= {CW{1'b0}};
                tick  <= 1'b1;
            end else begin
                count <= count + 1'b1;
            end
        end
    end
endmodule