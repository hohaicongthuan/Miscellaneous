module FIFOCounter(Clk, En, Rst_N, data_out);
    parameter DATA_WIDTH = 15;
	 parameter CONST_ZERO = 15'd0;
	 parameter CONST_ONE = 15'd1;
	 
	 input Clk, En, Rst_N;
    output reg [DATA_WIDTH - 1:0] data_out;

    always @ (posedge Clk or negedge Rst_N) begin
        if (~Rst_N) data_out <= CONST_ZERO;
        else data_out <= (En) ? data_out + CONST_ONE : data_out;
    end
endmodule