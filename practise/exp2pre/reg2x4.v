// 练习 1：2 个 4 位寄存器
// 要求：
// 1. clr 为高电平异步复位，复位时两个寄存器都清零。
// 2. clk 上升沿且 we 为高时，将 d 写入 wsel 选择的寄存器。
// 3. 未被选中的寄存器保持原值。
// 4. rsel 异步选择一个寄存器送到 q，无需等待时钟。
module reg2x4 (
    input        clk,
    input        clr,
    input        we,
    input        wsel,
    input        rsel,
    input  [3:0] d,
    output [3:0] q
);

// 在这里补全代码
reg [3:0]   reg0;
reg [3:0]   reg1;

always @(posedge clk or posedge clr) begin
    if (clr) begin
        reg0 <= 4'b0000;
        reg1 <= 4'b0000;
    end
        else if (we) begin
            case(wsel)
            1'b0 : reg0 <= d;
            1'b1 : reg1 <= d;
            default : ;
            endcase
        end
end


assign q = (rsel) ? reg1 : reg0;
endmodule
