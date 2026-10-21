module contador_aritimetico_crescente_sincrono (
    input clk, rst,
    output reg [3:0] XYZW
);

always @ (negedge clk)
begin
    if (!rst)
        XYZW <= 4'b0000; // Começa em 0 ao resetar
    else
        XYZW <= XYZW + 1'b1; // Incrementa +1 a cada borda de descida
end

endmodule