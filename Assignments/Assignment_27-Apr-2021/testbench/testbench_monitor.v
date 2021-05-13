module testbench_monitor(Clk, data_in);
    parameter DATA_WIDTH = 8;
    integer   outfile;

    input   Clk;
    input   [DATA_WIDTH - 1:0] data_in;

    always @ (posedge Clk) begin
        outfile = $fopen("bitmap.out", "w");
        $fdisplay(outfile, "%h", data_o);
    end
endmodule