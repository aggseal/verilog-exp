// 练习 2：扫描索引按 0,1,...,7,0 循环。
// index=0 对应最右侧 DK0，index=7 对应最左侧 DK7。
module scan_index (
    input  wire       clk,
    input  wire       rst,
    input  wire       scan_tick,
    output reg  [2:0] index
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            index <= 3'd0;
        else if (scan_tick) begin
            if (index == 3'd7)
                index <= 3'd0;
            else
                index <= index + 3'd1;
        end
    end
endmodule
