// 4 位通用移位寄存器
// CLR 为同步高电平清零。{S1,S0}: 00 保持，01 右移（RIN 移入 QA 端），
// 10 左移（LIN 移入 QD 端），11 并行装入 {A,B,C,D}。
module universal_shift4 (
    input CLK, CLR, RIN, LIN, S0, S1,
    input A, B, C, D,
    output reg QA, QB, QC, QD
);
    always @(posedge CLK) begin
        if (CLR)
            {QA, QB, QC, QD} <= 4'b0000;
        else begin
            case ({S1, S0})
                2'b00: ;
                2'b01: {QA, QB, QC, QD} <= {RIN, QA, QB, QC};
                2'b10: {QA, QB, QC, QD} <= {QB, QC, QD, LIN};
                2'b11: {QA, QB, QC, QD} <= {A, B, C, D};
                default: {QA, QB, QC, QD} <= 4'b0000;
            endcase
        end
    end
endmodule
