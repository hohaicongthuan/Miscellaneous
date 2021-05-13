// I couldn't implement the convolution unit in structural model
// so I decided to implement it using behavioural model 

module ConvUnit(Clk, data_in, data_out, valid_in, valid_out);
    parameter   DATA_WIDTH = 8;
    integer     i;

    input       Clk, valid_in;
    input       [DATA_WIDTH - 1:0] data_in;
    output reg  valid_out;
    output reg  [DATA_WIDTH - 1:0] data_out;

    reg     [14:0] Counter;
    reg     [DATA_WIDTH - 1:0] LineBuffer [299:0];
    // reg     [DATA_WIDTH - 1:0] Final_Pixel;

    always @ (posedge Clk) begin
        if (valid_in & (Counter < 10000)) begin
            Counter <= Counter + 1;
            
            for (i = 0; i < 299; i = i + 1) begin
                LineBuffer[i + 1] <= LineBuffer[i];
            end

            LineBuffer[0] <= data_in;

            if (Counter >= 300) begin
                data_out <= LineBuffer[299] + (~LineBuffer[297] + 1) + (LineBuffer[199] << 1) + (~(LineBuffer[197] << 1) + 1) + LineBuffer[99] + (~LineBuffer[97] + 1);
                valid_out <= 1;
            end else begin
                valid_out <= 0;
            end
        end
        else Counter <= 0;
    end
endmodule