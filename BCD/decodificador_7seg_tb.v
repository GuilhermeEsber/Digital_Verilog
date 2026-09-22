module decodificador_7seg_tb;

    reg  [3:0] DCBA;
    wire [6:0] abcdefg;

    // Instancia o circuito em teste
    decodificador_7seg dut (
        .DCBA(DCBA),
        .abcdefg(abcdefg)
    );

    initial begin
        $monitor("DCBA = %b | Saida abcdefg = %b", DCBA, abcdefg);

        DCBA = 4'b0000; #10; // 0
        DCBA = 4'b0001; #10; // 1
        DCBA = 4'b0010; #10; // 2
        DCBA = 4'b0011; #10; // 3
        DCBA = 4'b0100; #10; // 4
        DCBA = 4'b0101; #10; // 5
        DCBA = 4'b0110; #10; // 6
        DCBA = 4'b0111; #10; // 7
        DCBA = 4'b1000; #10; // 8
        DCBA = 4'b1001; #10; // 9
        DCBA = 4'b1010; #10; // A
        DCBA = 4'b1011; #10; // b
        DCBA = 4'b1100; #10; // C
        DCBA = 4'b1101; #10; // d
        DCBA = 4'b1110; #10; // E
        DCBA = 4'b1111; #10; // F

        $stop;
    end

endmodule