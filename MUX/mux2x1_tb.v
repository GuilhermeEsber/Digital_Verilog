module mux2x1_tb();

    reg  [1:0] d;
    reg        sel;
    wire       y;

    // Instancia o MUX 2x1
    mux2x1 dut (
        .d(d),
        .sel(sel),
        .y(y)
    );

    initial begin
        $monitor("D = %b | S = %b | Y = %b", d, sel, y);

        // D = 00
        d = 2'b00; sel = 1'b0; #10;
        d = 2'b00; sel = 1'b1; #10;

        // D = 01
        d = 2'b01; sel = 1'b0; #10;
        d = 2'b01; sel = 1'b1; #10;

        // D = 10
        d = 2'b10; sel = 1'b0; #10;
        d = 2'b10; sel = 1'b1; #10;

        // D = 11
        d = 2'b11; sel = 1'b0; #10;
        d = 2'b11; sel = 1'b1; #10;

        $stop;
    end

endmodule 