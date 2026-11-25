module detector_sequencia_1101 (
    input  wire clk,
    input  wire rst,
    input  wire bit_entrada,
    output reg  bit_saida
);

    localparam [2:0] S0 = 3'd0,
                     S1 = 3'd1,
                     S2 = 3'd2,
                     S3 = 3'd3,
                     S4 = 3'd4;

    reg [2:0] estado_atual, proximo_estado;

    always @(posedge clk or negedge rst) begin
        if (!rst)
            estado_atual <= S0;
        else
            estado_atual <= proximo_estado;
    end

    always @(*) begin
        proximo_estado = S0;
        bit_saida = 1'b0;

        case (estado_atual)

            S0: begin
                proximo_estado = bit_entrada ? S1 : S0;
            end

            S1: begin
                proximo_estado = bit_entrada ? S2 : S0;
            end

            S2: begin
                proximo_estado = bit_entrada ? S2 : S3;
            end

            S3: begin
                proximo_estado = bit_entrada ? S4 : S0;
            end

            S4: begin
                bit_saida = 1'b1;
                proximo_estado = bit_entrada ? S2 : S0;
            end

            default: begin
                proximo_estado = S0;
            end

        endcase
    end

endmodule
