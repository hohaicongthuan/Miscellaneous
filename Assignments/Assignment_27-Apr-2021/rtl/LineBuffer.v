module LineBuffer(data_in, data_out, Clk);
    parameter DATA_WIDTH = 14;
    parameter BUFFER_DEPTH = 97;
    integer i;

    input  Clk;
    input  [DATA_WIDTH - 1:0] data_in;
    output reg [DATA_WIDTH - 1:0] data_out;

	 reg [DATA_WIDTH - 1:0] Buffer [BUFFER_DEPTH - 1:0];
	 
    always @ (posedge Clk) begin
		 data_out <= Buffer[BUFFER_DEPTH - 1];
		 for (i = BUFFER_DEPTH - 1; i > 0; i = i - 1) begin
		     Buffer[i] <= Buffer[i - 1];
		 end
		 Buffer[0] <= data_in;
	 end

endmodule