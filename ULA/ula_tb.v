`timescale 1ns/100ps
module ula_tb();
    // Declare aqui os sinais envolvidos na simulacao
    reg [2:0] A;
    reg [2:0] B;
    reg [2:0] S;
    wire [3:0] F;

    // Declare aqui modulo do circuito sendo testado
    ula_3bits dut(
        .A(A),
        .B(B),
        .S(S),
        .F(F)
    );

    // Descreva aqui o sinal de selecao da ULA incrementando a cada 1ns
    always begin
        #1 S = S + 1;
    end

    initial begin
        // Sinal de selecao da ULA inicia a simulacao com valor "000"
        S = 3'b000;
        
        // Descreva aqui o valor inicial das entradas A e B (aspas retas e ';' adicionados)
        A = 3'b101;
        B = 3'b001;
    end

    // Apos o tempo necessário a simulacao encerra (ajustado para 8ns)
    initial begin 
        #8 $stop;
    end

endmodule 