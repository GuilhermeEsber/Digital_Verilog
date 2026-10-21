module contador_aritimetico_decrescente_sincrono (
    input clk, rst,
    output reg [3:0] XYZW
);

always @ (negedge clk)
begin
    if (!rst)
        XYZW <= 4'b1111; // Começa em 0 ao resetar
    else
        XYZW <= XYZW - 1'b1; // Decrementa -1 a cada borda de descida
end

endmodule