// 前置练习 01：固定周期的时钟使能
// 目的：练习用主时钟计数，并每隔固定数量的 clk 周期产生一个单周期 tick。
// 本练习不使用按键启动计数，tick 仅作为使能信号，不作为其他逻辑的时钟。
// 练习周期设为 4 个 clk 周期，便于观察计数过程；正式题目再换成所需周期。
module practice_01_fixed_tick (
    input  wire clk,
    input  wire rst,
    output reg  tick
);

reg [3:0] cnt;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        tick <= 0;
        cnt <= 0; 
    end
    else begin
        tick <= 0;
        if (cnt == 3) begin
            tick <= 1;
            cnt <= 0;
        end
        else begin
            cnt <= cnt + 1;
        end
    end
end

endmodule
