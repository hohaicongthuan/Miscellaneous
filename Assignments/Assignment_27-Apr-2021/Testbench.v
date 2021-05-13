 `timescale 1ns/1ps

module Testbench();
    parameter   waittime  = 20;
    parameter   clocktime = 10;
    parameter   DATAWIDTH = 8;
    integer     i, outfile, infile;

    reg     Clk, valid_in;
    reg     [7:0] data_i;
    wire    [7:0] data_o;
    wire    valid_out;

    initial begin
        Clk = 1'b0; // Initial value of the clock signal
        forever #clocktime Clk = ~Clk; // Generates clock pulses forever
    end
    
    initial begin
        outfile = $fopen("bitmap.out", "w");
        infile  = $fopen("bitmap.in", "r");

        // read the contents of the file bitmap.in as hexadecimal values into register "data_i".
        while (! $feof(infile)) begin       // read until an "end of file" is reached.
            $fscanf(infile,"%h\n", data_i); // scan each line and get the value as an hexadecimal
            valid_in = 1'b1;
            #waittime;

            if (valid_out) $fdisplay(outfile, "%h", data_o); else ;
        end
        
        #waittime;
        $fclose(outfile);
        #waittime;
        $finish;
    end

    ConvUnit ConvUnit_Inst0(
        .Clk(),
        .data_in(),
        .data_out(),
        .valid_in(),
        .valid_out()
    );

endmodule