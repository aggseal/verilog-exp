// 练习 3：八位动态扫描显示控制器。
// 需与 seg7_decode、tick_gen、scan_index 一起编译。
// EGO1 位选高有效，8 位数码管分为两组段选总线；两组输出同一段码。
// display[3:0] 对应 DK0，display[31:28] 对应 DK7。
module led_ctrl_unit #(
    parameter integer SCAN_DIV = 100_000
) (
    input  wire        clk,
    input  wire        rst,
    input  wire [31:0] display,
    output reg  [7:0]  led_en,
    output wire [7:0]  led_cx0,
    output wire [7:0]  led_cx1
);
    wire scan_tick;
    wire [2:0] index;
    reg  [3:0] digit;
    wire [7:0] seg_data;

    tick_gen #(.DIV(SCAN_DIV)) u_tick_gen (
        .clk(clk), .rst(rst), .tick(scan_tick)
    );

    scan_index u_scan_index (
        .clk(clk), .rst(rst), .scan_tick(scan_tick), .index(index)
    );

    seg7_decode u_seg7_decode (
        .hex(digit), .seg(seg_data)
    );

    assign led_cx0 = seg_data;
    assign led_cx1 = seg_data;

    always @(*) begin
        // 根据 index 从 display 选择 digit。
        // index=0 -> display[3:0]，index=1 -> display[7:4]，依此类推。
        case (index)
            3'd0 : digit = display[3:0];
            3'd1 : digit = display[7:4];
            3'd2 : digit = display[11:8];
            3'd3 : digit = display[15:12];
            3'd4 : digit = display[19:16];
            3'd5 : digit = display[23:20];
            3'd6 : digit = display[27:24];
            3'd7 : digit = display[31:28];
            default : digit =4'd0;
        endcase

        // 生成 EGO1 高有效 led_en，每次只使能当前一位。
        // index=0 -> 8'b0000_0001，index=7 -> 8'b1000_0000。
        case (index)
            3'd0 : led_en = 8'b0000_0001;
            3'd1 : led_en = 8'b0000_0010;
            3'd2 : led_en = 8'b0000_0100;
            3'd3 : led_en = 8'b0000_1000;
            3'd4 : led_en = 8'b0001_0000;
            3'd5 : led_en = 8'b0010_0000;
            3'd6 : led_en = 8'b0100_0000;
            3'd7 : led_en = 8'b1000_0000;
            default : led_en = 8'd0;
        endcase
    end
endmodule
