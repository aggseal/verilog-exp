// 练习 3：4 个 4 位寄存器，带两个独立的异步读端口
// 要求：
// 1. clr 为高电平异步复位，复位时四个寄存器都清零。
// 2. clk 上升沿且 we 为高时，将 d 写入 wsel 选择的寄存器。
// 3. 未被选中的寄存器保持原值。
// 4. rsel_a 和 rsel_b 分别异步选择寄存器送到 q_a 和 q_b。
// 5. 两个读端口可以同时选择同一个或不同的寄存器。
module reg4x4_2r (
    input        clk,
    input        clr,
    input        we,
    input  [1:0]  wsel,
    input  [1:0]  rsel_a,
    input  [1:0]  rsel_b,
    input  [3:0]  d,
    output [3:0]  q_a,
    output [3:0]  q_b
);
reg [3:0] regs[0:3];
integer i;

always @ (posedge clk or posedge clr) begin
    if (clr) begin
        for (i = 0; i < 4 ;i = i + 1)
        regs[i] <= 4'b0000;
    end
    else if (we) begin
        regs[wsel] <= d;
    end
       
end

assign q_a = regs[rsel_a];
assign q_b = regs[rsel_b];

endmodule
