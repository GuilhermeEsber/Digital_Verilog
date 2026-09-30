`timescale 1ns/1ps

module deslocador_universal_tb;
    // Parâmetro do tamanho do deslocador
    parameter size = 4;

    // Entradas do DUT
    reg [size-1:0] E;
    reg Er, El;
    reg clk, load, dir;

    // Saída do DUT
    wire [size-1:0] Y;

    // Instanciar o DUT (Device Under Test)
    deslocador_universal #(.size(size)) uut (
        .E(E),
        .Er(Er),
        .El(El),
        .clk(clk),
        .load(load),
        .dir(dir),
        .Y(Y)
    );

    // Geração de clock
    always #5 clk = ~clk; // período de 10ns

    initial begin
        // Inicializações
        clk  = 0;
        load = 0;
        dir  = 0;
        E    = 0;
        Er   = 0;
        El   = 0;

        // Início da simulação
        $display("Iniciando simulação do deslocador universal...");
        $monitor($time, " | Y=%b | E=%b | load=%b | dir=%b | Er=%b | El=%b", 
                 Y, E, load, dir, Er, El);

        // --- Teste 1: Carregar valor inicial ---
        #2 load = 1; E = 4'b1011;
        #10 load = 0;

        // --- Teste 2: Deslocamento para a esquerda com Er=1 ---
        dir = 0; Er = 1;
        #50;

        // --- Teste 3: Deslocamento para a esquerda com Er=0 ---
        dir = 0; Er = 0;
        #50;

        // --- Teste 4: Deslocamento para a direita com El=0 ---
        dir = 1; El = 0;
        #50;

        // --- Teste 5: Deslocamento para a direita com El=1 ---
        dir = 1; El = 1;
        #50;

        // --- Teste 6: Recarregar novo valor ---
        #2 load = 1; E = 4'b1100;
        #10 load = 0;

        // Mais deslocamentos para verificar comportamento
        dir = 0; Er = 0;
        #40;

        $display("Fim da simulação.");
        $stop;
    end

endmodule
