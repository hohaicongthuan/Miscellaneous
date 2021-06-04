module Case_4(x, y, Clk);
    parameter a = 1;
    parameter b = 2;
    parameter c = 3;

    input Clk;
    input [7:0] x;
    output[7:0] y;

    reg [7:0] reg_1, reg_2, reg_3, reg_4, reg_5;

    always @ (posedge Clk) begin
        reg_1 = x * x;
        reg_2 = x * b;
        reg_3 = reg_1 * a;
        reg_4 = reg_2;
        reg_5 = reg_3 + reg_4;
        y = reg_5 + c;
    end
endmodule
 
