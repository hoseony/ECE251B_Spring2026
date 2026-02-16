module mux4 (
    input   logic [31:0] d0,
    input   logic [31:0] d1,
    input   logic [31:0] d2,
    input   logic [31:0] d3,
    input   logic [1:0]  s, //2bit selection pin
    output  logic [31:0] data_out
);

    logic [31:0] result_01;
    logic [31:0] result_23;

    mux2 u1 (.d0(d0), .d1(d1), .s(s[0]), .data_out(result_01));
    mux2 u2 (.d0(d2), .d1(d3), .s(s[0]), .data_out(result_23));

    mux2 u3 (.d0(result_01), .d1(result_23), .s(s[1]), .data_out(data_out));

endmodule





