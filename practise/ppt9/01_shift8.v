// 8 位串入并出移位寄存器
// 要求：CLK 上升沿更新；CLR 为同步高电平清零；SERIN 从最低位方向移入，原数据向高位移动一位。
module shift8 (
    input CLK,
    input CLR,
    input SERIN,
    output reg [7:0] Q
);
    always @(posedge CLK) begin
        if (CLR)   Q <= 8'b0000_0000;
        else Q <= {Q[6:0], SERIN};
    end
endmodule
