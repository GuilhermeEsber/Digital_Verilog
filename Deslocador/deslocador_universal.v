module deslocador_universal #(
    parameter size = 4
) (
    input wire [size-1:0] E,
    input wire Er,
    input wire El,
    input wire clk,
    input wire load,
    input wire dir,
    output reg [size-1:0] Y
);

    always @(posedge clk) begin
        if (load) begin
            Y <= E;
        end else begin
            if (dir == 1'b0) begin
                // Deslocamento para a esquerda: entra pela direita (Er)
                Y <= {Y[size-2:0], Er};
            end else begin
                // Deslocamento para a direita: entra pela esquerda (El)
                Y <= {El, Y[size-1:1]};
            end
        end
    end

endmodule