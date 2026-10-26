// 4 位模 13 计数器
// 在 CLK 上升沿采样。CLR=1 时同步置数为 3；否则 LD=1 时将 D 装入 Q。
// CLR、LD 均无效时，只有 ENP=1 且 ENT=1 才计数；控制优先级为 CLR > LD > 计数 > 保持。
// 计数序列为 3, 4, ..., 12, 3；有效计数时 Q=12 回到 3，其余有效值加 1。
// RCO 为组合高有效输出：ENT=1 且 Q=12 时为 1，不依赖 ENP。
module mod13_counter (
    input CLK, CLR, LD, ENP, ENT,
    input [3:0] D,
    output reg [3:0] Q,
    output reg RCO
);
    always @(posedge CLK) begin
        if (CLR)    Q <= 4'b0011;
        else if (LD)    Q <= D;
        else if (ENP && ENT) begin
            if (Q == 4'b1100)   Q <= 4'b0011;
            else Q <= Q + 4'b1;
        end
        else ;
    end

    always @(*) begin
        if (ENT && (Q == 4'b1100))  RCO = 1;
        else    RCO =0;
    end
endmodule
