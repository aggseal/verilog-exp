// 练习 2：4 个 4 位寄存器
// 要求：
// 1. clr 为高电平异步复位，复位时四个寄存器都清零。
// 2. clk 上升沿且 we 为高时，将 d 写入 wsel 选择的寄存器。
// 3. 未被选中的寄存器保持原值。
// 4. rsel 异步选择一个寄存器送到 q，无需等待时钟。
module reg4x4 (
    input        clk,
    input        clr,
    input        we,
    input  [1:0]  wsel,
    input  [1:0]  rsel,
    input  [3:0]  d,
    output [3:0]  q  //如果不是reg，不要用always赋值哟
);

reg [3:0]   reg0;
reg [3:0]   reg1;
reg [3:0]   reg2;
reg [3:0]   reg3;

always @ (posedge clk or posedge clr) begin
    if (clr) begin
        reg0 <= 4'b0000;
        reg1 <= 4'b0000;
        reg2 <= 4'b0000;
        reg3 <= 4'b0000;
    end
    else if (we)
    case (wsel)
    2'b00 : reg0 <= d;
    2'b01 : reg1 <= d;
    2'b10 : reg2 <= d;
    2'b11 : reg3 <= d;
    default : ;
    endcase

end
assign q = (rsel == 2'b00) ? reg0 :
           (rsel == 2'b01) ? reg1 :
           (rsel == 2'b10) ? reg2 : reg3;

endmodule
