	`timescale 1ns / 100ps
module mux4x1_tb;

    reg [3:0] d;
    reg [1:0] sel;
    wire y;

    // Instancia o multiplexador
    mux4x1 uut (
        .d(d),
        .sel(sel),
        .y(y)
    );

    always #1 d[0] = ~d[0];  // Período de 2 ns

    always #2 d[1] = ~d[1];  // Período de 4 ns

    always #4 d[2] = ~d[2]; // Período de 8 ns

    always #8 d[3] = ~d[3]; // Período de 16 ns

    always #16 sel = sel + 1;  // Incrementa "sel" a cada 16 ns
        

    initial begin
        sel = 2'b00;
	d = 4'b0000;
        $display("Tempo | d | sel | y");
        $monitor("%4t | %b | %b | %b", $time, d, sel, y);

        #64 $display("Simulação finalizada.");
        $stop;
    end

endmodule
