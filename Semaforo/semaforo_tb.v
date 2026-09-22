module semaforo_tb;

    // Entradas
    reg A, B, C, D;

    // Saidas
    wire FA, FB, FC, FD;

    // Variavel do loop
    integer i;

    // Instancia do circuito
    semaforo uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .FA(FA),
        .FB(FB),
        .FC(FC),
        .FD(FD)
    );

    initial begin

        // Cabecalho
        $display("A B C D | FA FB FC FD");
        $display("---------------------");

        // Testa as 16 combinacoes
        for (i = 0; i < 16; i = i + 1) begin

            {A, B, C, D} = i;

            #1;

            $display("%b %b %b %b | %b  %b  %b  %b",
                     A, B, C, D, FA, FB, FC, FD);

        end

        $finish;

    end

endmodule
