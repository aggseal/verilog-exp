// 练习 08：用 8 位比较器级联成 64 位比较器
// 要求：比较 8 个字节切片，再根据高位到低位的优先级合成最终结果。
// 依赖：先完成 07_comparator_8bit.v 中的 comparator_8bit。
module comparator_8bit (
    input  [7:0] P, Q,
    output reg   PGTQ,
    output reg   PEQQ,
    output reg   PLTQ
);
    always @(*) begin
        // TODO: 用 if / else if / else 覆盖三种比较结果
        if (P > Q) begin 
            PGTQ = 1;
            PEQQ = 0; 
            PLTQ = 0;
        end
        else if (P == Q) begin
            PGTQ = 0;
            PEQQ = 1;
            PLTQ = 0;
        end   
        else begin
            PGTQ = 0;
            PEQQ = 0;
            PLTQ = 1;
        end
    end
endmodule

module comparator_64bit (
    input  [63:0] P, Q,
    output        PGTQ,
    output        PEQQ,
    output        PLTQ
);
    wire [7:0] GT, EQ, LT;

    // TODO: 实例化 8 个字节比较器，并比较中间结果
    comparator_8bit u_cmp_byte7(
        .P(P[63:56]),
        .Q(Q[63:56]),
        .PGTQ(GT[7]),
        .PEQQ(EQ[7]),
        .PLTQ(LT[7])
    );
    comparator_8bit u_cmp_byte6(
        .P(P[55:48]),
        .Q(Q[55:48]),
        .PGTQ(GT[6]),
        .PEQQ(EQ[6]),
        .PLTQ(LT[6])
    );
    comparator_8bit u_cmp_byte5(
        .P(P[47:40]),
        .Q(Q[47:40]),
        .PGTQ(GT[5]),
        .PEQQ(EQ[5]),
        .PLTQ(LT[5])
    );
    comparator_8bit u_cmp_byte4(
        .P(P[39:32]),
        .Q(Q[39:32]),
        .PGTQ(GT[4]),
        .PEQQ(EQ[4]),
        .PLTQ(LT[4])
    );
    comparator_8bit u_cmp_byte3(
        .P(P[31:24]),
        .Q(Q[31:24]),
        .PGTQ(GT[3]),
        .PEQQ(EQ[3]),
        .PLTQ(LT[3])
    );
    comparator_8bit u_cmp_byte2(
        .P(P[23:16]),
        .Q(Q[23:16]),
        .PGTQ(GT[2]),
        .PEQQ(EQ[2]),
        .PLTQ(LT[2])
    );
    comparator_8bit u_cmp_byte1(
        .P(P[15:8]),
        .Q(Q[15:8]),
        .PGTQ(GT[1]),
        .PEQQ(EQ[1]),
        .PLTQ(LT[1])
    );
    comparator_8bit u_cmp_final(
        .P(GT),
        .Q(LT),
        .PGTQ(PGTQ),
        .PEQQ(PEQQ),
        .PLTQ(PLTQ)
    );

endmodule
