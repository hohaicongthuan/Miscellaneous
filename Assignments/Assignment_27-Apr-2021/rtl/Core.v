module Core(data_in, data_out, Clk);
    parameter DATA_WIDTH = 8;

    input   Clk;
    input   [DATA_WIDTH - 1:0] data_in;
    output  [DATA_WIDTH - 1:0] data_out;

    wire Conv_Valid_Out, Full_Sgnl, Inv_Full_Sgnl;
    wire [DATA_WIDTH - 1:0] ConvUnit_Out;

    not(Inv_Full_Sgnl, Full_Sgnl);

    Conv #(.DATA_WIDTH(DATA_WIDTH)) Conv_Inst0(
        .data_in(data_in),
        .data_out(ConvUnit_Out),
        .Clk(Clk),
        .valid_out(Conv_Valid_Out),
        .is_OutBuff_notFull(Inv_Full_Sgnl)
    );

    FIFO #(.DATA_WIDTH(DATA_WIDTH)) Output_FIFO(
        .data_in(ConvUnit_Out),
        .data_out(data_out),
        .Clk(Clk),
        .Enqueue(Conv_Valid_Out),
        .Dequeue(1'b1),
        .Rst_N(1'b1),
        .Full(Full_Sgnl),
        .Empty()
    );
endmodule