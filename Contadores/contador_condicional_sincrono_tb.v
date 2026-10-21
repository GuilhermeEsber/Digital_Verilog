`timescale 1ns / 100ps

module contador_condicional_sincrono_tb;

    reg clk, rst;
    wire [3:0] XYZW;

    // Instancia o contador_condicional_sincrono
    contador_condicional_sincrono uut (
        .clk(clk),
        .rst(rst),
        .XYZW(XYZW)
    );

    // #10 inverte a cada 10ns -> Período total = 20ns (incrementa a cada 20ns)
    always #10 clk = ~clk;

    initial begin
        clk = 0;
        rst = 0; // Ativa o reset (zerando tudo)

        #20;     // Espera 20ns com reset ativo
        
        rst = 1; // Libera o contador para iniciar a sequência

        #400;    // Tempo para observar vários ciclos de contagem

        $finish;
    end

endmodule