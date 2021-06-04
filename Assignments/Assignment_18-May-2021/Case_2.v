module Case_2(x, y, Clk);
    parameter a = 1;
    parameter b = 2;
    parameter c = 3;

    input Clk;
    input [7:0] x;
    output reg [7:0] y;

    reg [7:0] reg_1, reg_2;

    always @ (posedge Clk) begin
        reg_1 = x * x;
        reg_2 = x * b;
        y = reg_1 * a + reg_2 + c;
    end
endmodule
 
