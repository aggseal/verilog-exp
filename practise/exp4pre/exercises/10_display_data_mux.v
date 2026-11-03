// 练习 10：SW0 模式选择与 8 位显示数据拼接。
// 学号：2025311563；sw0=1 时显示后 8 位 25311563。
// 从左到右映射 DK7..DK0：2、5、3、1、1、5、6、3。
// sw0=0：DK7..DK6 显示末两位 63；DK5..DK4 未消抖计数；
//        DK3..DK2 消抖计数；DK1..DK0 0..20 计数。
module display_data_mux (
    input  wire       sw0,
    input  wire [3:0] student_d7,
    input  wire [3:0] student_d6,
    input  wire [3:0] student_d5,
    input  wire [3:0] student_d4,
    input  wire [3:0] student_d3,
    input  wire [3:0] student_d2,
    input  wire [3:0] student_d1,
    input  wire [3:0] student_d0,
    input  wire [3:0] raw_tens,
    input  wire [3:0] raw_ones,
    input  wire [3:0] clean_tens,
    input  wire [3:0] clean_ones,
    input  wire [3:0] count_tens,
    input  wire [3:0] count_ones,
    output reg  [31:0] display_data
);
    always @(*) begin
        if (sw0) begin
            display_data = {student_d7, student_d6, student_d5, student_d4,
                            student_d3, student_d2, student_d1, student_d0};
        end else begin
            display_data = {student_d1, student_d0,
                            raw_tens, raw_ones,
                            clean_tens, clean_ones,
                            count_tens, count_ones};
        end
    end
endmodule