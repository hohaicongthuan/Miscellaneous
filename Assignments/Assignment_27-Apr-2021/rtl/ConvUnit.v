module ConvUnit(data_in, data_out, Clk, valid_out, is_OutBuff_notFull);
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

    // MULTIPLIERS
    Multiplier #(.DATA_WIDTH(DATA_WIDTH)) Mul_Inst0(
        .in_A(8'd1),
        .in_B(Pixel_0),
        .out_Product(Pixel_0_Product)
    );
    Multiplier #(.DATA_WIDTH(DATA_WIDTH)) Mul_Inst1(
        .in_A(8'd0),
        .in_B(Pixel_1),
        .out_Product(Pixel_1_Product)
    );
    Multiplier #(.DATA_WIDTH(DATA_WIDTH)) Mul_Inst2(
        .in_A(-8'd1),
        .in_B(Pixel_2),
        .out_Product(Pixel_2_Product)
    );
    Multiplier #(.DATA_WIDTH(DATA_WIDTH)) Mul_Inst3(
        .in_A(8'd2),
        .in_B(Pixel_3),
        .out_Product(Pixel_3_Product)
    );
    Multiplier #(.DATA_WIDTH(DATA_WIDTH)) Mul_Inst4(
        .in_A(8'd0),
        .in_B(Pixel_4),
        .out_Product(Pixel_4_Product)
    );
    Multiplier #(.DATA_WIDTH(DATA_WIDTH)) Mul_Inst5(
        .in_A(-8'd2),
        .in_B(Pixel_5),
        .out_Product(Pixel_5_Product)
    );
    Multiplier #(.DATA_WIDTH(DATA_WIDTH)) Mul_Inst6(
        .in_A(8'd1),
        .in_B(Pixel_6),
        .out_Product(Pixel_6_Product)
    );
    Multiplier #(.DATA_WIDTH(DATA_WIDTH)) Mul_Inst7(
        .in_A(8'd0),
        .in_B(Pixel_7),
        .out_Product(Pixel_7_Product)
    );
    Multiplier #(.DATA_WIDTH(DATA_WIDTH)) Mul_Inst8(
        .in_A(-8'd1),
        .in_B(Pixel_8),
        .out_Product(Pixel_8_Product)
    );

    // ADDERS
    Adder #(.DATA_WIDTH(DATA_WIDTH * 2)) Adder_Inst0(
        .in_00(Pixel_0_Product),
        .in_01(Pixel_1_Product),
        .in_02(Pixel_2_Product),
        .in_03(Pixel_3_Product),
        .in_04(Pixel_4_Product),
        .in_05(Pixel_5_Product),
        .in_06(Pixel_6_Product),
        .in_07(Pixel_7_Product),
        .in_08(Pixel_8_Product),
        .out_Sum(Adder_Out)
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