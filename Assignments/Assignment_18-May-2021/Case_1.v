module Case_1(x, y);
    parameter a = 1;
    parameter b = 2;
    parameter c = 3;

    input [7:0] x;
    output[7:0] y;

    assign y = a*x*x + b*x + c;
endmodule
