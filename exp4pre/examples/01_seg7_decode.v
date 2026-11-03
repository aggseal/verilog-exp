// 示例 1：EGO1 七段译码器接口说明
// 段码顺序：{CA,CB,CC,CD,CE,CF,CG,DP}；EGO1 段选高有效。
// 输出 seg 为高有效段码，可直接连接 EGO1 的段选信号。
module seg7_decode (
    input  wire [3:0] hex,
    output reg  [7:0] seg
);
    always @(*) begin
        case (hex)
            4'h0: seg = 8'hFC;
            4'h1: seg = 8'h60;
            4'h2: seg = 8'hDA;
            4'h3: seg = 8'hF2;
            4'h4: seg = 8'h66;
            4'h5: seg = 8'hB6;
            4'h6: seg = 8'hBE;
            4'h7: seg = 8'hE0;
            4'h8: seg = 8'hFE;
            4'h9: seg = 8'hF6;
            4'hA: seg = 8'hEE;
            4'hB: seg = 8'h3E;
            4'hC: seg = 8'h9C;
            4'hD: seg = 8'h7A;
            4'hE: seg = 8'h9E;
            4'hF: seg = 8'h8E;
            default: seg = 8'h00;  //好好去记表算了，不然也只能自己推。。。
        endcase
    end
endmodule
