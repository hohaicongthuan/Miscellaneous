module Counter(Clk, data_out);
    parameter DATA_WIDTH = 14;

    input  Clk;
    output reg data_out;

    reg [DATA_WIDTH - 1:0] Memory;

    always @ (posedge Clk) begin
        if (Memory > 14'd300) data_out <= 1'b1; else data_out <= 1'b0;
        if (Memory > 14'd10000) Memory <= 14'd1; else Memory <= Memory + 14'd1;
    end

endmodule