// 练习 12：12 位奇偶校验生成与检测
// 数据帧由 11 位 DATA 和 1 位校验位组成，共 12 位。
// PARITY_MODE=0：偶校验；PARITY_MODE=1：奇校验。
// PARITY_OUT：为 DATA 生成发送时附加的校验位。
// ERROR：检查收到的 {DATA, PARITY_IN}；校验不通过时为 1。
module parity_12bit (
    input  [10:0] DATA,
    input         PARITY_MODE,
    input         PARITY_IN,
    output        PARITY_OUT,
    output        ERROR
);
    // TODO 1: 根据 DATA 和 PARITY_MODE 生成 PARITY_OUT
    assign PARITY_OUT = (PARITY_MODE) ? ~^DATA : ^DATA;

    // TODO 2: 检查 DATA 与 PARITY_IN 的整体奇偶性，生成 ERROR
    // 提示：使用归约异或运算符。
    assign ERROR = ((^{DATA, PARITY_IN}) == PARITY_MODE) ? 1'b0 : 1'b1;

endmodule
