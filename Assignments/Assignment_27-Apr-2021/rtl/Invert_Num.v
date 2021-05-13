module Invert_Num(data_in, data_out);
    parameter DATA_WIDTH = 8;

    input   [DATA_WIDTH - 1:0] data_in;
    output  [DATA_WIDTH * 2 - 1:0] data_out;

    assign data_out = ~{8'd0, data_in} + 1;
endmodule