module decoder_test (
    output logic [3:0] dec,
    input logic [1:0] sel
);

assign dec[2] = (sel == 2'b10) ? 1 : 0;

endmodule
