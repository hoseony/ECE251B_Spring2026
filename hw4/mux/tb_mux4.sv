`timescale 1ns/1ps

module tb_mux4;
    logic [31:0] d0, d1, d2, d3;
    logic [1:0] s;
    logic [31:0] data_out;

    mux4 dut(
        .d0(d0),
        .d1(d1),
        .d2(d2),    
        .d3(d3),
        .s(s),
        .data_out(data_out)
    );


    initial begin
        $display("\n===============================");
        $display("         MUX4 TESTBENCH         ");
        $display("===============================");

        d0 = 1;
        d1 = 2;
        d2 = 3;
        d3 = 4;
        s = 0;
        #10 $display("S = %b Inputs = (%d, %d, %d, %d) -> Out=%d", s, d0, d1, d2, d3, data_out);

        s = 1;
        #10 $display("S = %b Inputs = (%d, %d, %d, %d) -> Out=%d", s, d0, d1, d2, d3, data_out);

        s = 2;
        #10 $display("S = %b Inputs = (%d, %d, %d, %d) -> Out=%d", s, d0, d1, d2, d3, data_out);

        s = 3;
        #10 $display("S = %b Inputs = (%d, %d, %d, %d) -> Out=%d", s, d0, d1, d2, d3, data_out);

        $finish;
    end
endmodule
