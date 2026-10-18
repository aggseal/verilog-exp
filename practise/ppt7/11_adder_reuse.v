// 练习 11：通过选择信号复用加法器
// 要求：SEL=1 时计算 A+B；SEL=0 时计算 C+D。
module adder_reuse (
    input        SEL,
    input  [7:0] A, B, C, D,
    output [7:0] S
);
    // TODO: 用条件操作符选择两组操作数
    wire [7:0] X = (SEL) ? A : C;
    wire [7:0] Y = (SEL) ? B : D;
    assign S = X + Y;

endmodule
