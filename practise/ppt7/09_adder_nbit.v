// 练习 09：可参数化的 N 位全加器
// 要求：将进位输出与和拼接，接收 N+1 位的无符号加法结果。
module adder_nbit #(
    parameter N = 8
) (
    input      [N-1:0] A, B,
    input              CIN,
    output     [N-1:0] S,
    output             COUT
);
    // TODO: 加上 A、B 和 CIN
    assign {COUT, S} = A + B + CIN;
endmodule
