// 带同步清零、同步装载和使能的 4 位二进制计数器
// 在 CLK 上升沿采样。CLR=1 时同步清零；否则 LD=1 时将 D 装入 Q。
// CLR、LD 均无效时，只有 ENP=1 且 ENT=1 才计数；控制优先级为 CLR > LD > 计数 > 保持。
// Q 为 4 位无符号二进制数，计数范围 0..15，递增到 15 后回到 0。
// RCO 为组合高有效输出：ENT=1 且 Q=15 时为 1，不依赖 ENP。
module binary_counter4 (
    input CLK, CLR, LD, ENP, ENT,
    input [3:0] D,
    output reg [3:0] Q,
    output reg RCO
);
    always @(posedge CLK) begin
        if (CLR)    Q <= 4'b0;
        else if (LD)    Q <= D;
        else if (ENP && ENT) begin
            if (Q = 4'h15)  Q <= 4'b0;
            else    Q <= Q + 4'b1;
        end
        else ;
    end

    always @(*) begin
        // TODO
    end
endmodule
