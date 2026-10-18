// 练习 06：9 位奇偶校验
// 要求：ODD 在 I 中 1 的个数为奇数时为 1；EVEN 在个数为偶数时为 1。
module parity_9bit (
    input  [8:0] I,
    output       EVEN,
    output       ODD
);
    // TODO: 使用归约异或生成偶校验位和奇校验位
    assign ODD = ^I;
    assign EVEN = ~^I;
endmodule
