module FIFO(data_in, data_out, Clk, Enqueue, Dequeue, Rst_N, Full, Empty);
    parameter DATA_WIDTH 	= 24;
	parameter FIFO_DEPTH 	= 1024; // = 2^10
	parameter FIFO_ADDR 	= 11;
	 
	input Clk, Enqueue, Dequeue, Rst_N;
    input [DATA_WIDTH - 1:0] data_in;
    output Full, Empty;
    output [DATA_WIDTH - 1:0] data_out;

    wire EnQ_Sgnl, DeQ_Sgnl, Compare_Result, MSB_Front_Rear_Cmp, Inv_MSB_Front_Rear_Cmp, Inv_Empty, Inv_Full;
    wire [FIFO_ADDR - 1:0] Front_Addr, Rear_Addr;

    xor(MSB_Front_Rear_Cmp, Front_Addr[FIFO_ADDR - 1], Rear_Addr[FIFO_ADDR - 1]);
    not(Inv_MSB_Front_Rear_Cmp, MSB_Front_Rear_Cmp);

	 // Empty and Full Signals
    and(Empty, Inv_MSB_Front_Rear_Cmp, Compare_Result);
	not(Inv_Empty, Empty);
    and(Full, MSB_Front_Rear_Cmp, Compare_Result);
	not(Inv_Full, Full);
	 
	 // Enqueue & Dequeue Signals
	 // We can only enqueue if there are enqueue signal AND the queue is NOT FULL
	 and(EnQ_Sgnl, Enqueue, Inv_Full);
	 // We can only dequeue if there are dequeue signal AND the queue is NOT EMPTY
	 and(DeQ_Sgnl, Dequeue, Inv_Empty);

    FIFOCounter #(.DATA_WIDTH(FIFO_ADDR), .CONST_ZERO(11'd0), .CONST_ONE(11'd1)) Counter_Front_Inst0(
        .Clk(Clk),
        .En(DeQ_Sgnl),
        .Rst_N(Rst_N),
        .data_out(Front_Addr)
    );
    FIFOCounter #(.DATA_WIDTH(FIFO_ADDR), .CONST_ZERO(11'd0), .CONST_ONE(11'd1)) Counter_Rear_Inst0(
        .Clk(Clk),
        .En(EnQ_Sgnl),
        .Rst_N(Rst_N),
        .data_out(Rear_Addr)
    );

    Comparator #(.DATA_WIDTH(FIFO_ADDR - 1)) Cmp_Inst0(
        .data_in_A(Front_Addr[FIFO_ADDR - 2:0]),
        .data_in_B(Rear_Addr[FIFO_ADDR - 2:0]),
        .cmp_rslt(Compare_Result)
    );

    RAM #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(FIFO_ADDR - 1), .RAM_DEPTH(FIFO_DEPTH)) RAM_Inst0(
        .data_in(data_in),
        .data_out(data_out),
        .Read_En(DeQ_Sgnl),
        .Write_En(EnQ_Sgnl),
        .Read_Addr(Front_Addr[FIFO_ADDR - 2:0]),
        .Write_Addr(Rear_Addr[FIFO_ADDR - 2:0])
    );
endmodule