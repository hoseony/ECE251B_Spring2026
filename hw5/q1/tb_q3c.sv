module tb_decoder_test;

    logic [1:0] sel;
    logic [3:0] dec;

    decoder_test dut (
        .sel(sel),
        .dec(dec)
    );

    initial begin
        $display("Time\t sel\t dec[2]");
        $monitor("%0t\t %b\t %b", $time, sel, dec[2]);

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $finish;
    end

endmodule
