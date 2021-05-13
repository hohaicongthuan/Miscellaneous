module RAM(data_in, data_out, Read_En, Write_En, Read_Addr, Write_Addr);
    parameter DATA_WIDTH = 8;
	parameter ADDR_WIDTH = 11;
	parameter RAM_DEPTH = 1024; // = 2^10
	parameter CONST_HiZ = 8'dz;
	 
	input Read_En, Write_En;
    input [DATA_WIDTH - 1:0] data_in;
    input [ADDR_WIDTH - 1:0] Read_Addr, Write_Addr;

    output reg [DATA_WIDTH - 1:0] data_out;

    reg [DATA_WIDTH - 1:0] Memory [RAM_DEPTH - 1:0];

    always @ (data_in, Read_Addr, Write_Addr, Read_En, Write_En) begin
        data_out <= (Read_En) ? Memory[Read_Addr] : CONST_HiZ;
        if (Write_En) Memory[Write_Addr] <= data_in;
        else;
    end

endmodule