module REG(data_in, data_out, Clk);
    parameter DATA_WIDTH = 14;

    input       Clk;
    input       [DATA_WIDTH - 1:0] data_in;
    output reg  [DATA_WIDTH - 1:0] data_out;

    always @ (posedge Clk) begin
        data_out <= data_in;
    end
endmodule