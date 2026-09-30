module deslocador_universal #(
    parameter size = 4
) (
    input wire [size-1:0] E, //Entrada de dados
    input wire Er, //Bit de entrada da direita (LSB)
    input wire El, //Bit de entrada de esquerda (MSB)
    input wire clk, //Sinal de clk
    input wire load, //Carrega dados
    input wire dir, //Direção de rotação
    output reg [size-1:0] Y //Saída
);

    always @(posedge clk) begin
        if (load) begin
            Y <= E;
        end else begin
            if (dir == 1'b0) begin //Em 0 desloca para a esquerda
                // Deslocamento para a esquerda: entra pela direita (Er)
                Y <= {Y[size-2:0], Er};
            end else begin //Em 1 desloca para a direita
                // Deslocamento para a direita: entra pela esquerda (El)
                Y <= {El, Y[size-1:1]};
            end
        end
    end

endmodule
