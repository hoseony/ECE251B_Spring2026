module mux2 (
    input   logic [31:0] d0,        //input 1 
    input   logic [31:0] d1,        //input 2
    input   logic        s,         //selection pin
    output  logic [31:0] data_out
);

   assign data_out = s ? d1 : d0;

endmodule
