module register_n #(parameter WIDTH = 32)(
    input logic clk,
    input logic rst_n,
    input logic en,
    input logic [WIDTH-1:0] d,
    output logic [WIDTH-1:0] q 
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
           q <= 0;
        else if(en)
            q <= d;
        else
            q <= q;
    end

endmodule


/* lists to implement
[v]Parameters: Width (default to 32)
[ ]on negative edge of rst_n, q resets to 0
[ ]on positive edge of clk
    if en is high
        q = d
    else q = q
*/
