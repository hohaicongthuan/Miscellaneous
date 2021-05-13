module Multiplier(in_A, in_B, out_Product);
    parameter DATA_WIDTH = 14;

    input   [DATA_WIDTH - 1:0] in_A, in_B;
    output  [DATA_WIDTH * 2 - 1:0] out_Product;

    assign out_Product = in_A * in_B;
endmodule