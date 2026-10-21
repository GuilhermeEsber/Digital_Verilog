module contadores_top (
    input clk, // Sinal de relógio
    input rst, // Sinal de reset
    output [6:0] hex0, // Display de 7-seg 0 (Contador Condicional)
    output [6:0] hex1, // Display de 7-seg 1 (Contador Crescente)
    output [6:0] hex2  // Display de 7-seg 2 (Contador Decrescente)
);

	// 1. Fios internos para conectar as saídas dos contadores aos decodificadores
	wire [3:0] contagem_1;
	wire [3:0] contagem_2;
	wire [3:0] contagem_3;

	// 2. Instanciação dos 3 Contadores
	contador_condicional_sincrono cnt1 (
		.clk(clk),
		.rst(rst),
		.XYZW(contagem_1)
	);

	contador_aritimetico_crescente_sincrono cnt2 (
		.clk(clk),
		.rst(rst),
		.XYZW(contagem_2)
	);

	contador_aritimetico_decrescente_sincrono cnt3 (
		.clk(clk),
		.rst(rst),
		.XYZW(contagem_3)
	);

	// 3. Instanciação dos Decodificadores de 7 Segmentos
	decodificador_7seg dec1 (
		.DCBA(contagem_1), 
		.abcdefg(hex0)
	);

	decodificador_7seg dec2 (
		.DCBA(contagem_2), 
		.abcdefg(hex1)
	);

	decodificador_7seg dec3 (
		.DCBA(contagem_3), 
		.abcdefg(hex2)
	);

endmodule