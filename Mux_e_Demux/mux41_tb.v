`timescale 1ns / 100ps

module tb_mux_4x1;
    reg [3:0] D;    // Vetor de entradas (4 bits)
    reg [1:0] S;    // Vetor de seleção (2 bits)
    wire Y;         // Saída do MUX

    // Instancia o MUX 4x1 (assume que já existe um módulo mux_4x1)
    mux41 uut (
        .D(D),
        .S(S),
        .Y(Y)
    );

    initial begin
        // Configura o monitor para exibir as mudanças
        $monitor("Tempo=%0t | S=%b | D=%b | Y=%b", 
                 $time, S, D, Y);

        // Define valores iniciais das entradas
        D = 4'b1010; // D0=1, D1=0, D2=1, D3=0

        // Testa todas as combinações de seleção
        S = 2'b00; #10;
        S = 2'b01; #10;
        S = 2'b10; #10;
        S = 2'b11; #10;

        // Finaliza a simulação
        $finish;
    end
endmodule
