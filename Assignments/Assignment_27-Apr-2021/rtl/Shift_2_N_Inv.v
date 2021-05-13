module Shift_2_N_Inv(data_in, data_out);
    parameter DATA_WIDTH = 8;

    input   [DATA_WIDTH - 1:0]      data_in;
    output  [DATA_WIDTH * 2 - 1: 0] data_out;

    wire [DATA_WIDTH * 2 - 1: 0] temp;

    assign temp = {8'd0, data_in};
    assign data_out = ~(temp << 1'b1) + 16'd1;
endmodule