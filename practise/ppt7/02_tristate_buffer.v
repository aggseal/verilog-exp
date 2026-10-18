// 练习 02：8 位三态缓冲器（类似 74x541）
// 要求：G1_L、G2_L 同时为低时输出 A，否则输出高阻态 Z。
module tristate_buffer (
    input        G1_L,
    input        G2_L,
    input  [7:0] A,
    output [7:0] Y
);
    // TODO: 用条件操作符描述使能和高阻态
    assign Y = (~|{G1_L,G2_L}) ? A : 8'bzzzz_zzzz;
endmodule
