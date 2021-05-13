module Selector(data_in_A, data_in_B, sel, data_out);
    input sel;
    input [10:0] data_in_A, data_in_B;
    output [10:0] data_out;

    assign data_out = (sel) ? data_in_B : data_in_A;
endmodule