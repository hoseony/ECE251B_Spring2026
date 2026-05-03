`timescale 1ns/1ps

module tb_register_n;

    localparam int WIDTH = 32;    

    logic clk;
    logic rst_n;
    logic en;
    logic [WIDTH-1:0] d;
    logic [WIDTH-1:0] q;

    register_n #(.WIDTH(WIDTH)) dut( 
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .d(d),
        .q(q)    
    );

    initial begin
        $dumpfile("tb_register_n.vcd");
        $dumpvars(0, tb_register_n);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial rst_n = 0;
    always #10 rst_n = ~rst_n;

    initial en = 0;
    always #20 en = ~en;

    initial begin

        $display("\n----------------------");
        d = 32'h1111_1111;

        $monitor("Time=%t, Clk=%b, rst_n=%b, en=%b, d=%h, q=%h", $time, clk, rst_n, en, d, q);

        #100;

        $finish;
    end
endmodule
