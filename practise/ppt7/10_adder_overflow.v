// 练习 10：检测 8 位有符号加法溢出
// 提示：输入符号相同且结果符号不同，才发生有符号溢出。
// 拓展：另写一个模块，用 9 位结果检测无符号进位 COUT。
module adder_overflow (
    input      [7:0] A, B,
    output     [7:0] S,
    output           OVFL
);
    // TODO: 计算 S 并根据符号位检测溢出
    assign S = A + B;
    assign OVFL = (A[7] == B[7]) && (S[7] != A[7]);
endmodule

module adder_nosign(
    input       [7:0] C, D,
    output      [7:0] S,
    output            COUT
);
    assign {COUT,S} = C + D;
endmodule

