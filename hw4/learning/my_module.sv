module my_module (
    input logic         clk,    //single bit signal
    input logic         rst,
    input logic [3:0]   data_in, //4 bit signal MSB:3 , LSB: 0 
    output logic [3:0]   data_out 
);

    // here we define internal signals, parameters and types before using them
    logic [3:0] internal_signal;
    localparam WIDTH = 4; //by my understanding this just decalres local varisable called width and making it 4.

    // Dataflow: continuous assignment
    assign internal_signal = ~data_in;  // ~ is bitwise not

    // this is making sequential logic here
    always_ff @(posedge clk) begin
        if (rst) 
            data_out <= 4'b0; // so alway_ff you use <= but alwasy_comb you use =
        else
            data_out <= internal_signal;
    end

endmodule

//to test this logic, we need testbench.
//--> let's go to tb_my_module.sv
