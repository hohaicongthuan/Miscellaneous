module testbench_gen(Clk, data_out);
    parameter   DATA_WIDTH = 8;
    integer     infile;

    input   Clk;
    output reg  [DATA_WIDTH - 1:0] data_out;

    always @ (posedge Clk) begin
        infile = $fopen("bitmap.in", "r");
        while (! $feof(infile)) begin       // read until an "end of file" is reached.
            $fscanf(infile,"%h\n", data_o); // scan each line and get the value as an hexadecimal
        end
        $finish;
    end
endmodule