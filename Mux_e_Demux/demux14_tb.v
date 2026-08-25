`timescale 1ns / 100ps

module demux14_tb;
    reg D;        // Entrada do DEMUX
    reg S1, S0;   // Seletores
    wire Y0, Y1, Y2, Y3; // Saídas do DEMUX

    // Instancia o DEMUX 1x4 (assume um módulo demux_1x4 já definido)
    demux14 uut (
        .D(D), 
        .S1(S1), .S0(S0),
        .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3)
    );

    initial begin
        // Configura o monitor para exibir as mudanças
        $monitor("Tempo=%0t | S1=%b S0=%b | D=%b | Y0=%b Y1=%b Y2=%b Y3=%b",
                 $time, S1, S0, D, Y0, Y1, Y2, Y3);

        // Teste: Define valores de entrada
        D = 1;

        // Testa todas as combinações de seletores
        S1 = 0; S0 = 0; #10;
        S1 = 0; S0 = 1; #10;
        S1 = 1; S0 = 0; #10;
        S1 = 1; S0 = 1; #10;

        // Finaliza a simulação
        $finish;
    end
endmodule
