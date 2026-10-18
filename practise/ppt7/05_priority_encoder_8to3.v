// 练习 05：8 线-3 线优先编码器
// 要求：I[7] 优先级最高；输入全 0 时 IDLE=1；否则 IDLE=0。
module priority_encoder_8to3 (
    input      [7:0] I,
    output reg [2:0] A,
    output reg       IDLE
);
    always @(*) begin
        // TODO: 从 I[7] 到 I[0] 按优先级编码
        if (~|(I)) IDLE = 1;
        else IDLE = 0; 
    end
    always @(*) begin
            case(1'b1)
            I[7] : A = 3'b111;
            I[6] : A = 3'b110;
            I[5] : A = 3'b101;
            I[4] : A = 3'b100;
            I[3] : A = 3'b011;
            I[2] : A = 3'b010;
            I[1] : A = 3'b001;
            I[0] : A = 3'b000;
            default : A = 3'b000;
            endcase
        end
endmodule
