// 4 位递增/递减计数器
// 在 CLK 上升沿采样。CLR=1 时同步清零；否则 LD=1 时将 D 装入 Q。
// CLR、LD 均无效时，只有 ENP=1 且 ENT=1 才计数；控制优先级为 CLR > LD > 计数 > 保持。
// UPDN=1 时 Q 加 1；UPDN=0 时 Q 减 1。Q 为 4 位数，溢出按模 16 回绕。
// RCO 为组合高有效输出：ENT=1 且（递增时 Q=15 或递减时 Q=0）时为 1，不依赖 ENP。
module up_down_counter4 (
    input CLK, CLR, LD, ENP, ENT, UPDN,
    input [3:0] D,
    output reg [3:0] Q,
    output reg RCO
);
    always @(posedge CLK) begin
        if (CLR)    Q <= 4'b0;
        else if (LD)    Q <= D;
        else if (ENP && ENT) begin
            if (UPDN)  Q <= Q + 4'b1;
            else    Q <= Q - 4'b1;
        end
        else ;
    end

    always @(*) begin
        if ((ENT && UPDN && Q == 4'd15) || ( ENT && ~UPDN && Q == 4'b0))    RCO = 1;
        else RCO = 0;
    end
endmodule
