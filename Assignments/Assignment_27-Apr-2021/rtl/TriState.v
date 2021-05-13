module TriState(data_in, data_out, en);
    parameter DATA_WIDTH = 16;

    input   en;
    input   [DATA_WIDTH - 1:0] data_in;
    output  [DATA_WIDTH - 1:0] data_out;

    assign  data_out = (en) ? data_in : 16'dz;
endmodule