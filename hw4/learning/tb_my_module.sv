`timescale 1ns/1ps // this defines time unit / precision
                   // time unit defines what #1 means, in this case 1ns
                   // time precision is the smalleset unit that simulator can
                   // represent

module tb_my_module; // components that you want to test should be declared here

    // DUT signalsa *dut meaning design under test (DUT: Device Undet Test)
    // here you are declaring variables that need to be connected
    logic clk;
    logic rst;
    logic [3:0] data_in;
    logic [3:0] data_out;

    // Instantiate DUT
    // This is like wiring things together
    my_module dut(
        .clk(clk), // testbench clk --> DUT clk, but inside the module(testbench)
        .rst(rst),
        .data_in(data_in),
        .data_out(data_out)     
    );

    initial clk = 0;        // initialize clk to be 0
    always #5 clk = ~clk;    // you made a clock nice 

    // dump waves (for GTKwave)
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_my_module);
    end

    // ------------------------------------
    // Nice job, now you have initilized ts
    // ------------------------------------

    initial begin
        $display("time | rst | clk | data_in | data_out |");
        $monitor("t=%0t| rst=%b | clk=%b | data_in=%h | data_out=%h", $time, clk, rst, data_in, data_out);

        // t for time
        // b for bindary
        // h for hex


        rst = 1;
        data_in = 4'h0; //4 bits, hexadecimal base, A is the number

        repeat (2) @(posedge clk);
        rst = 0;
        // it holds rst = 0 for 2 pos edge clock

        // let's test some values
        data_in = 4'hA; @(posedge clk);
        data_in = 4'h0; @(posedge clk);
        data_in = 4'hB; @(posedge clk);
        
        $finish;
    end

endmodule 
