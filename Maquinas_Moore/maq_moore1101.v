
module maq_moore1101 (clk, bit_entrada, rst, bit_saida);

input wire clk, bit_entrada, rst;
output reg bit_saida;

// Regulamentos internos
reg [2:0] estado_atual, proximo_estado;

// Definição de estado pelo usuário
localparam S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3, S4 = 3'd4;

always @(*)
begin
    case (estado_atual)

        S0: if (bit_entrada) proximo_estado <= S1;
            else proximo_estado <= S0;

        S1: if (bit_entrada) proximo_estado <= S2;
            else proximo_estado <= S0;

        S2: if (bit_entrada) proximo_estado <= S2;
            else proximo_estado <= S3;

        S3: if (bit_entrada) proximo_estado <= S4;
            else proximo_estado <= S0;

        S4: if (bit_entrada) proximo_estado <= S2;
            else proximo_estado <= S0;

        default: proximo_estado <= S0;

    endcase
end

always @(posedge clk, negedge rst)
begin
    if (!rst)
        estado_atual <= S0;
    else
        estado_atual <= proximo_estado;
end

always @(estado_atual)
begin
    bit_saida = 1'b0;

    case (estado_atual)

        S0, S1, S2, S3: bit_saida = 1'b0;

        default: bit_saida = 1'b1;

    endcase
end

endmodule
