// 练习 07：8 位无符号数值比较器
// 要求：PGTQ、PEQQ、PLTQ 互斥，分别表示 P>Q、P=Q、P<Q。
module comparator_8bit (
    input  [7:0] P, Q,
    output reg   PGTQ,
    output reg   PEQQ,
    output reg   PLTQ
);
    always @(*) begin
        // TODO: 用 if / else if / else 覆盖三种比较结果
        if (P > Q) begin 
            PGTQ = 1;
            PEQQ = 0; 
            PLTQ = 0;
        end
        else if (P == Q) begin
            PGTQ = 0;
            PEQQ = 1;
            PLTQ = 0;
        end   
        else begin
            PGTQ = 0;
            PEQQ = 0;
            PLTQ = 1;
        end
    end
endmodule
