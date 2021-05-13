module testbench_top();
    parameter   DATA_WIDTH  = 8;
    parameter   clocktime   = 10;

    reg  Clk;
    reg  [DATA_WIDTH - 1:0] data_in;
    wire [DATA_WIDTH - 1:0] data_out;
    wire [DATA_WIDTH - 1:0] tb_gen_out, core_out;

    initial begin
        Clk = 1'b0; // Initial value of the clock signal
        forever #clocktime Clk = ~Clk; // Generates clock pulses forever
    end

    testbench_monitor #(.DATA_WIDTH(DATA_WIDTH))   tb_mon_Inst0(
        .Clk(Clk),
        .data_in(core_out)
    );
    testbench_gen #(.DATA_WIDTH(DATA_WIDTH))       tb_gen_Inst0(
        .Clk(Clk),
        .data_out(tb_gen_out)
    );
    Core #(.DATA_WIDTH(DATA_WIDTH))                core_Inst0(
        .data_in(tb_gen_out),
        .data_out(core_out),
        .Clk(Clk)
    );
endmodule