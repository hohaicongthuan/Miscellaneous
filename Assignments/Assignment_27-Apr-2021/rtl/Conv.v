module Conv(data_in, data_out, Clk, valid_out, is_OutBuff_notFull);
    parameter DATA_WIDTH = 8;

    input   Clk, is_OutBuff_notFull;
    input   [DATA_WIDTH - 1:0]      data_in;
    output  valid_out;
    output  [DATA_WIDTH * 2 - 1:0]  data_out;

    // INTERNAL WIRES
    wire Counter_Out;
    wire [DATA_WIDTH - 1:0] Line_1_Buff_Out, Line_2_Buff_Out, Line_3_Buff_Out,
                            Pixel_0, Pixel_1, Pixel_2,
                            Pixel_3, Pixel_4, Pixel_5,
                            Pixel_6, Pixel_7, Pixel_8;
    wire [DATA_WIDTH * 2 - 1:0] Pixel_0_Product, Pixel_1_Product, Pixel_2_Product,
                                Pixel_3_Product, Pixel_4_Product, Pixel_5_Product,
                                Pixel_6_Product, Pixel_7_Product, Pixel_8_Product,
                                Adder_Out;

    // LINE BUFFERS
    LineBuffer #(.DATA_WIDTH(DATA_WIDTH)) Line_1_Buff(
        .data_in(data_in),
        .data_out(Line_1_Buff_Out),
        .Clk(Clk)
    );
    LineBuffer #(.DATA_WIDTH(DATA_WIDTH)) Line_2_Buff(
        .data_in(Pixel_6),
        .data_out(Line_2_Buff_Out),
        .Clk(Clk)
    );
    LineBuffer #(.DATA_WIDTH(DATA_WIDTH)) Line_3_Buff(
        .data_in(Pixel_3),
        .data_out(Line_3_Buff_Out),
        .Clk(Clk)
    );

    // REGISTERS
    REG #(.DATA_WIDTH(DATA_WIDTH)) REG_Inst0(
        .data_in(Pixel_1),
        .data_out(Pixel_0),
        .Clk(Clk)
    );
    REG #(.DATA_WIDTH(DATA_WIDTH)) REG_Inst1(
        .data_in(Pixel_2),
        .data_out(Pixel_1),
        .Clk(Clk)
    );
    REG #(.DATA_WIDTH(DATA_WIDTH)) REG_Inst2(
        .data_in(Line_3_Buff_Out),
        .data_out(Pixel_2),
        .Clk(Clk)
    );
    REG #(.DATA_WIDTH(DATA_WIDTH)) REG_Inst3(
        .data_in(Pixel_4),
        .data_out(Pixel_3),
        .Clk(Clk)
    );
    REG #(.DATA_WIDTH(DATA_WIDTH)) REG_Inst4(
        .data_in(Pixel_5),
        .data_out(Pixel_4),
        .Clk(Clk)
    );
    REG #(.DATA_WIDTH(DATA_WIDTH)) REG_Inst5(
        .data_in(Line_2_Buff_Out),
        .data_out(Pixel_5),
        .Clk(Clk)
    );
    REG #(.DATA_WIDTH(DATA_WIDTH)) REG_Inst6(
        .data_in(Pixel_7),
        .data_out(Pixel_6),
        .Clk(Clk)
    );
    REG #(.DATA_WIDTH(DATA_WIDTH)) REG_Inst7(
        .data_in(Pixel_8),
        .data_out(Pixel_7),
        .Clk(Clk)
    );
    REG #(.DATA_WIDTH(DATA_WIDTH)) REG_Inst8(
        .data_in(Line_1_Buff_Out),
        .data_out(Pixel_8),
        .Clk(Clk)
    );

    // ADDERS
    Adder #(.DATA_WIDTH(DATA_WIDTH * 2)) Adder_Inst0(
        .in_00({8'd0, Pixel_0}),        // x  1
        .in_01(16'd0),                  // x  0
        .in_02(Pixel_2_Product),        // x -1
        .in_03(Pixel_3_Product),        // x  2
        .in_04(16'd0),                  // x  0
        .in_05(Pixel_5_Product),        // x -2
        .in_06({8'd0, Pixel_6}),        // x  1
        .in_07(16'd0),                  // x  0
        .in_08(Pixel_8_Product),        // x -1
        .out_Sum(Adder_Out)
    );

    Invert_Num #(.DATA_WIDTH(DATA_WIDTH)) Inv_Num_Inst0(
        .data_in(Pixel_2),
        .data_out(Pixel_2_Product)
    );
    Invert_Num #(.DATA_WIDTH(DATA_WIDTH)) Inv_Num_Inst1(
        .data_in(Pixel_8),
        .data_out(Pixel_8_Product)
    );

    Shift_2 Shift_2_Inst0(
        .data_in(Pixel_3),
        .data_out(Pixel_3_Product)
    );
    Shift_2_N_Inv Shift_2_N_Inv_Inst0(
        .data_in(Pixel_5),
        .data_out(Pixel_5_Product)
    );

    Counter Counter_Inst0(
        .Clk(Clk),
        .data_out(Counter_Out)
    );

    TriState Tri_Inst0(
        .data_in(Adder_Out),
        .data_out(data_out),
        .en(Counter_Out)
    );

    assign valid_out = Counter_Out & is_OutBuff_notFull;
    
endmodule 
